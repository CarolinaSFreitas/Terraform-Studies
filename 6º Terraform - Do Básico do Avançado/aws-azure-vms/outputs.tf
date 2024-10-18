output "vm-aws-ip" {
  value       = aws_instance.vm.public_ip
  description = "IP público da instância AWS"
}

output "vm-azure-ip" {
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
  description = "IP público da instância Azure"
}