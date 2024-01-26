// configurando o Apache

provider "azurerm" {
    subscription_id = "5c8b6f3a-2c82-4e15-9168-9ecbf2bfc06a"
    features{

    }
}

variable "subscription_id" {
  type = string
  sensitive = true
}

//criação do resource group usando variáveis
resource "azurerm_resource_group" "apache_tf_rg" {
    name = var.resource_group_name
    location = var.location    

    lifecycle {
      prevent_destroy = false
    }
}

//criação do storage account usando variáveis
resource "azurerm_storage_account" "apache_terraform_sa" {
  name                     = "${var.prefix}sa"
  resource_group_name      = azurerm_resource_group.apache_tf_rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

//criação de vnet pra VM
resource "azurerm_virtual_network" "apache_terraform_vnet" {
  name                = var.virtual_network_name
  resource_group_name = azurerm_resource_group.apache_tf_rg.name
  location            = var.location
  address_space       = var.address_space
}

//criação de subnet pra vnet
resource "azurerm_subnet" "subnet" {
  name                 = "${var.prefix}_subnet"
  virtual_network_name = azurerm_virtual_network.apache_terraform_vnet.name
  resource_group_name  = azurerm_resource_group.apache_tf_rg.name
  address_prefixes     = var.subnet_prefix 
}

//criação de ip público
resource "azurerm_public_ip" "apache_terraform_public_ip" {
  name                = "${var.prefix}_public_ip"
  resource_group_name = azurerm_resource_group.apache_tf_rg.name
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = var.hostname
}

//criação de security group pra rede
resource "azure_network_sg" "apache_terraform_stg" {
  name                = "${var.prefix}_sg"
  location            = var.location
  resource_group_name = azurerm_resource_group.apache_tf_rg.name

  security_rule {
    name                       = "HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
} 

  security_rule {
    name                       = "SSH"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

//criação de interface de rede
resource "azurerm_network_interface" "apache_terraform_nic" {
  name                = "${var.prefix}_nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.apache_tf_rg.name

  ip_configuration {
    name                          = "${var.prefix}_ip_config"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.apache_terraform_public_ip.id
  }
}

//criação de VM
resource "azure_virtual_machine" "apache_terraform_site" {
  name                = "${var.hostname}_site"
  location            = var.location
  resource_group_name = azurerm_resource_group.apache_tf_rg.name
  vm_size             = var.vm_size 

  network_interface_ids = [ "${azurerm_network_interface.apache_terraform_nic.id}"]
  delete_os_disk_on_termination = "true"
  
  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
}

 storage_os_disk {
    name              = "${var.hostname}_osdisk"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
    create_option     = "FromImage"
}

 os_profile{
    computer_name  = var.hostname
    admin_username = var.admin_username
    admin_password = var.admin_password
 }

 os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
        path = "/home/${var.admin_username}/.ssh/authorized_keys"
      key_data = file("~/.ssh/id_rsa.pub")
    }
 }


    //garantir que o SSH esteja ativo antes de executarmos o exec local
 provisioner "remote-exec" {
 inline = [
    "sudo yum -y install httpd && sudo systemctl start httpd",
    "echo '<h1><center>Meu primeiro website usando Terraform</center></h1>' > index.html",
    "echo '<h2><center>Terraform e Apache Server no Azure</center></h2>' >> index.html",
    "echo '<h3><center>Carolina</center></h3>' >> index.html",
    "sudo mv index.html /var/www/html/",
    "sudo systemctl enable httpd"
    ]
    connection {
        type        = "ssh"
        host        = azurerm_public_ip.apache_terraform_public_ip.fqdn
        user        = var.admin_username
        private_key = file("~/.ssh/id_rsa")
     }
 }
}