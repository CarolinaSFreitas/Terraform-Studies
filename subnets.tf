terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm" //required features pra subir no azure as coisas via terraform
      version = "3.78.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "ResourceGroup-1"
    storage_account_name = "terraformteste123" // bloco que vai armazenar os dados dos arquivos 'tfstate' no conta de armazenamento, 
    container_name       = "terraform"         // no container criado lá
    key                  = "subnet.tfstate"
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true //ajeitou o bug do 'terraform plan'
}

resource "azurerm_subnet" "subnet1" {
  name                 = "Prod"
  resource_group_name  = var.RGName   //campos onde a indicação do nome vai; <a variável . o nome da variável>
  virtual_network_name = var.VNetName //campos onde a indicação do nome vai; <a variável . o nome da variável>
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "Dev"
  resource_group_name  = var.RGName   //campos onde a indicação do nome vai; <a variável . o nome da variável>
  virtual_network_name = var.VNetName //campos onde a indicação do nome vai; <a variável . o nome da variável>
  address_prefixes     = ["10.0.2.0/24"]
}
