variable "location" {
  description = "Localização do recurso. Curso de Terraform, Udemy."
  type        = string
  default     = "East US"
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

variable "resource_group_name" {
  description = "Nome do grupo de recursos. Curso de Terraform, Udemy."
  type        = string
  default     = "meu-resource-group"
}

variable "storage_account_name" {
  description = "Nome da conta de armazenamento. Curso de Terraform, Udemy."
  type        = string
  default     = "meusaterraformcarol"
}

variable "container_name" {
  description = "Nome do container de armazenamento. Curso de Terraform, Udemy."
  type        = string
  default     = "meu-container"
}