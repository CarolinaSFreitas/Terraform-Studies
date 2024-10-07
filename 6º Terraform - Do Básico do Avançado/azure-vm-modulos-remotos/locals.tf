locals {
  common_tags = {
    Owner       = "Carol"
    managed_by  = "Terraform"
    environment = var.environment
  }
}