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
