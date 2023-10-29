# Terraform no Azure
Estudos sobre Infrastructure as Code (IaC) com Terraform no Azure

**Documentação usada: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs**

1. 'resourceGroup.tf' define um Resource Group
2. 'VNET.tf' define uma Virtual Network
3. 'subnets.tf' define duas Subnets usando o RG e a VNet criadas anteriormente
4. 'subnets-variables.tf' define as variáveis para criação das Subnets, boa prática quando se tem muitas variáveis
5. 
