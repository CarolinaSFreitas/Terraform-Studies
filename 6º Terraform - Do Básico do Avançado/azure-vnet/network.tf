resource "azurerm_resource_group" "rsource_group" {
  name     = "rg-terraform-vnet-udemy"
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-terraform-udemy"
  resource_group_name = azurerm_resource_group.rsource_group.name
  location            = azurerm_resource_group.rsource_group.location
  address_space       = ["10.0.0.0/16"]

  tags = local.common_tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-terraform-udemy"
  resource_group_name  = azurerm_resource_group.rsource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-terraform-udemy"
  location            = azurerm_resource_group.rsource_group.location
  resource_group_name = azurerm_resource_group.rsource_group.name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = local.common_tags
}