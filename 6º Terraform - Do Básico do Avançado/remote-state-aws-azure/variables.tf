variable "location" {
  description = "Região onde os recursos serão criados"
  type        = string
  default     = "East US"
}

variable "account_tier" {
  description = "Tipo de conta de armazenamento"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Tipo de replicação da conta de armazenamento"
  type        = string
  default     = "LRS"
}
