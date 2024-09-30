output "subnet-id" {
  description = "Valor do ID da subnet"
  value       = aws_subnet.subnet.id
}

output "security-group-id" {
  description = "Valor do ID do security group"
  value       = aws_security_group.security_group.id
}