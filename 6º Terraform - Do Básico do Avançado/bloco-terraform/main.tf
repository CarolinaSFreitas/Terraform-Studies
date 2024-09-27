terraform {
  required_version = "~> 1.0.0" #versao 1.0.0 até a 1.0.n

  required_providers {
    aws = {
      version = "1.0"
      source  = "hashicorp/aws"
    }

    azurerm = {
      version = "2.0"
      source  = "hashicorp/azurerm"
    }

    # ...outros provedores
  }

  backend "s3" {
    # ...configurações do backend de acordo com o provedor
  }

}

