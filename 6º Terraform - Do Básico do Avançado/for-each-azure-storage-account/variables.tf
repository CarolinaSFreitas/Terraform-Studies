variable "location" {
  description = "Localização do recurso. Curso de Terraform, Udemy."
  type        = map(string)
  default = {
    "eua"    = "East US",
    "asia"   = "Japan East",
    "brasil" = "Brazil South"
  }
}

variable "account_tier" {
  description = "Tipo de conta de armazenamento. Curso de Terraform, Udemy."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Tipo de replicação da conta de armazenamento. Curso de Terraform, Udemy."
  type        = string
  default     = "LRS"
}
