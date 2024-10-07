terraform {
  required_version = ">=1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "bucket-terraform-remote-state"
    key    = "provider/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "Carol"
      managed_by = "Terraform"
    }
  }
}


provider "aws" {
  alias  = "australia"
  region = "ap-southeast-1"

  default_tags {
    tags = {
      owner      = "Carol"
      managed_by = "Terraform"
    }
  }
}


provider "aws" {
  alias  = "europa"
  region = "eu-west-1"

  default_tags {
    tags = {
      owner      = "Carol"
      managed_by = "Terraform"
    }
  }
}

module "vpc" {
  providers = {
    aws.provider_1 = aws.australia
    aws.provider_2 = aws.europa
  }

  source = "./vpc"
}