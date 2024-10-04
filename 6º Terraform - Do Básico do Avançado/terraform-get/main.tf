terraform {
  required_version = ">=1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.61.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.1.0"
}

module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.0.0"
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.17.0"
  vpc_id  = module.vpc.vpc_id
  name    = "my-security-group"
}