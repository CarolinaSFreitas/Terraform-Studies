output "vpc_id_default" {
  description = "Valor do ID da VPC default"
  value = aws_vpc.default.id
}

output "vpc_id_provider_1" {
  description = "Valor do ID da VPC do provider 1"
  value = aws_vpc.provider_1.id
}

output "vpc_id_provider_2" {
  description = "Valor do ID da VPC do provider 2"
  value = aws_vpc.provider_2.id
}