//bloco de provedor (azure)
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

//bloco de locals, define a localização do conjunto de disponibilidade (availability set)
locals {
    location = "EastUS"
    resourceGroup = "ResourceGroup-1"
    updateDomain = 6
    faultDomain = 2
}

resource "azurerm_availability_set" "avset1" {
  name                = "AvailabilitySet1"
  location            = local.location
  resource_group_name = local.resourceGroup

  platform_update_domain_count = local.updateDomain
  platform_fault_domain_count =  local.faultDomain
}

resource "azurerm_availability_set" "avset2" {
  name                = "AvailabilitySet2"
  location            = local.location
  resource_group_name = local.resourceGroup

  platform_update_domain_count = local.updateDomain
  platform_fault_domain_count =  local.faultDomain
}

resource "azurerm_availability_set" "avset3" {
  name                = "AvailabilitySet3"
  location            = local.location
  resource_group_name = local.resourceGroup

  platform_update_domain_count = local.updateDomain
  platform_fault_domain_count =  local.faultDomain
}
