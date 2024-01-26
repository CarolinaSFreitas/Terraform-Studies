# Estudos de Terraform 

**📃 Docs:**
  + https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
  + https://developer.hashicorp.com/terraform/language/values/locals
  + https://developer.hashicorp.com/terraform/language/settings/backends/azurerm
  + https://developer.hashicorp.com/terraform/language/state/remote-state-data
  + https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file
  + https://medium.com/@jorge.gongora2610/how-to-set-up-an-apache-web-server-on-azure-using-terraform-f7498daa9d66

## Estudos sobre Infrastructure as Code (IaC) com Terraform no Azure

**📂 1º Terraform on Azure | Udemy**
1. 'resourceGroup.tf' define um Resource Group
2. 'VNET.tf' define uma Virtual Network
3. 'subnets.tf' define duas Subnets usando o RG e a VNet criadas anteriormente
4. 'subnets-variables.tf' define as variáveis para criação das Subnets, boa prática quando se tem muitas variáveis
5. 'avset.tf' define Conjuntos de Disponibilidade
6. 'subnets.tf' possui um bloco a respeito de armazenar os arquivos que são .tfstate numa Conta de Armazenamento; em um container especifico
7. 'output.tf' define dois Outputs das subnets criadas
8. 'NIC.tf' define a Interface de Rede (network interface) usando as saídas (outputs) das subnets criadas anteriormente
9. 'VM.tf' define a criação da Virtual Machine 

## Estudos sobre Infrastructure as Code (IaC) com Terraform 

**📂 2º Terraform Tutorial for Beginners | KodeKloud**

  + Exemplo de bloco com explicação:
  ![block_example](image.png)

  + Exemplo de bloco com Terraform criando uma instância EC2 pra AWS:
  ![aws_ec2-creation_block](image-1.png)

  + Exemplo de bloco com Terraform criando um bucket do S3 pra AWS:
  ![aws_s3-bucket_creation_block](image-2.png)

  + Workflow básico/inicial:
  ![workflow-basico](image-3.png)

  + `` terraform show `` lista os resources criados com o Terraform

## Estudos sobre Infrastructure as Code (IaC) com Terraform provisionando um server Apache no Azure

**📂 3º Artigo sobre provisionamento de Apache através do Terraform no Azure | Jorge**

<img width="530" alt="image" src="https://github.com/CarolinaSFreitas/Terraform-Studies/assets/99994934/dd90ad28-10fc-45e4-827b-54e41f73679f">

- Testar o OpenSSL 