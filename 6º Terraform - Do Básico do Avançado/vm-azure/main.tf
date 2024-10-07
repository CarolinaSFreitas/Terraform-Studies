terraform {
  required_version = ">=1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.49.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-remote-state"
    storage_account_name = "sacarolremotestate"
    container_name       = "remote-state"
    key                  = "azure-vm/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-remote-state"
    storage_account_name = "sacarolremotestate"
    container_name       = "remote-state"
    key                  = "vnet-azure/terraform.tfstate"
  }
}
