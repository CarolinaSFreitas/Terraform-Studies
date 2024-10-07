terraform {
  required_version = ">=1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-remote-state"
    storage_account_name = "sacarolremotestate"
    container_name       = "remote-state"
    key                  = "for-each/terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}
