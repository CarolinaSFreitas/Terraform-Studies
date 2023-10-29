// em caso de muitas variáveis, criar um arquivo separado somente para variáveis para organizar, precisa estar na mesma pasta do arquivo que vai receber as variáveis

variable "RGName" {                         // interpolação 
  type = string                                             //variável do nome do resource group já criado, pra indicar na criação das subnets
  default = "ResourceGroup-1"
}

variable "VNetName" {
    type = string
    default = "virtualNetwork-1"                            //variável do nome da VNet já criada, pra indicar na criação das subnets
}
