output "subnet-id" {
  description = "Valor do ID da subnet"
  value       = aws_subnet.subnet.id
}

output "subnet-cidr" {
  description = "Valor do CIDR da subnet"
  value       = aws_subnet.subnet.cidr_block
}