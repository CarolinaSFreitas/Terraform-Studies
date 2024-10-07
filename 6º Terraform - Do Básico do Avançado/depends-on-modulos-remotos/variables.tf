variable "location" {
  description = "Região onde a VM será criada"
  type        = string
  default     = "East US"
}

variable "environment" {
  description = "Nome do ambiente"
  type        = string
  default     = "Dev"
}