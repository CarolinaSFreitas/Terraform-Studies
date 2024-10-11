output "subnet-0-id" {
  description = "Valor do ID da subnet"
  value       = aws_subnet.subnet[*].id
}

