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


resource "azurerm_resource_group" "example" {
  name     = "ResourceGroup1"
  location = "West Europe"
}


resource "azurerm_resource_group" "resourceGroup" {
  name     = "ResourceGroup-1"
  location = "West Europe"
}

resource "azurerm_virtual_network" "virtualNetwork" {
  name                = "virtualNetwork-1"
  location            = azurerm_resource_group.resourceGroup.location      //o '.resourceGroup.' vai no lugar do .example. q/ é o ex do lugar p/ nome do resource group
  resource_group_name = azurerm_resource_group.resourceGroup.name
  address_space       = ["10.0.0.0/16"]
  #dns_servers         = ["10.0.0.4", "10.0.0.5"]
} 
