variable "location" {
  description = "Região onde a VM será criada"
  type        = string
  default     = "East US"
}

variable "infra_version" {
  description = "Versão da infraestrutura"
  type        = number
  default     = 2
}