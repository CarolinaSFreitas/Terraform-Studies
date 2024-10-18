terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.72.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.6.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-remote-state"
    storage_account_name = "sacarolremotestate"
    container_name       = "remote-state"
    key                  = "pipeline-gitlab/terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "CarolFreitas"
      managed_by = "Terraform"
    }
  }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "bucket-terraform-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
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

