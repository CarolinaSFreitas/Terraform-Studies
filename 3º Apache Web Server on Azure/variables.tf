// Arquivo para as variáveis que serão usadas no código Terraform 

variable "prefix" {
    description = "Esse prefixo será incluído no nome de alguns recursos"
    default = "apachetf"
}

variable "resource_group_name" {
    description = "O nome do Resource Group no Azure"
    default = "Apache-Terraform"
}

variable "location" {
    description = "A região onde a VNET vai ser criada"
    default = "eastus"
}

variable "virtual_network_name" {
    description = "O nome da VNET"
    default = "VNet-Terraform-Apache"
}

variable "address_space" {
    description = "O bloco de IP que a VNet vai usar"
    default = "10.0.0.0/16"
}

variable "subnet_prefix" {
    description = "O prefixo da subnet"
    default = "10.0.2.0/24"
}

variable "hostname" {
  description = "O nome da VM host. Usada para hostname local, DNS e nomes relacionados a armazenamento."
  default = "vmtf"
}

variable "vm_size" {
  description = "Especificação do tamanho da VM"
  default = "Standard_A0"
}

variable "image_publisher" {
  description = "Quem publicou a imagem que será usada (az vm image list)"
  default = "RedHat"
}

variable "image_offer" {
  description = "Nome do offer (az vm image list)"
  default = "RHEL"
}

variable "image_sku" {
  description = "Nome do SKU (az vm image list)"
  default = "8"
}

variable "image_version" {
  description = "Versão da imagem (az vm image list)"
  default = "latest"
}

variable "admin_username" {
  description = "Username do adm"
  default = "admin"
}

variable "admin_password" {
  description = "Senha do user adm"
  default = "admin123!!!"
}

