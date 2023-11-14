terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.78.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true             //ajeitou o bug do 'terraform plan'
}


data "terraform_remote_state" "subnetID" {
  backend = "azurerm"
  
  config = {
    resource_group_name  = "ResourceGroup-1"
    storage_account_name = "terraformteste123" // bloco que vai armazenar os dados dos arquivos 'tfstate' no conta de armazenamento, 
    container_name       = "terraform"         // no container criado lá
    key                  = "subnet.tfstate"
  }
}

resource "azurerm_network_interface" "NIC1" {
  name                = "NetworkInterface1"
  location            = "West Europe"
  resource_group_name = "ResourceGroup-1"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.terraform_remote_state.subnetID.outputs.DevSubnet
    private_ip_address_allocation = "Dynamic"
  }
}
