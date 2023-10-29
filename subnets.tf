terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"                                            //required features pra subir no azure as coisas via terraform
      version = "3.78.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true             //ajeitou o bug do 'terraform plan'
}



variable "RGName" {                         // interpolação
  type = string                                             //variável do nome do resource group já criado, pra indicar na criação das subnets
  default = "ResourceGroup-1"
}

variable "VNetName" {
    type = string
    default = "virtualNetwork-1"                            //variável do nome da VNet já criada, pra indicar na criação das subnets
}


resource "azurerm_subnet" "subnet1" {
  name                 = "Prod"
  resource_group_name  = var.RGName                       //campos onde a indicação do nome vai; <a variável . o nome da variável>
  virtual_network_name = var.VNetName                 //campos onde a indicação do nome vai; <a variável . o nome da variável>
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "Dev"
  resource_group_name  = var.RGName                     //campos onde a indicação do nome vai; <a variável . o nome da variável>
  virtual_network_name = var.VNetName               //campos onde a indicação do nome vai; <a variável . o nome da variável>
  address_prefixes     = ["10.0.2.0/24"]
}
