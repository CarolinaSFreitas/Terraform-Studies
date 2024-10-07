output "subnet-0-id" {
  description = "Valor do ID da subnet"
  value       = aws_subnet.subnet[0].id
}

output "subnet-1-id" {
  description = "Valor do ID da subnet"
  value       = aws_subnet.subnet[1].id
}

output "subnet-2-id" {
  description = "Valor do ID da subnet"
  value       = aws_subnet.subnet[2].id
}
