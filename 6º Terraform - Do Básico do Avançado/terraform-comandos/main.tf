terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.60.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "rg-terraform-remote-state"
    storage_account_name      = "sacarolremotestate"
    container_name            = "remote-state"
    key                       = "commands/terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "carol"
      managed-by = "Terraform"
    }
  }

}