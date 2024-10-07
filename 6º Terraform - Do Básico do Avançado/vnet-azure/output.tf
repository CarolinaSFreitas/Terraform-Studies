output "subnet_id" {
  value       = azurerm_subnet.subnet.id
  description = "Valor de ID da Subnet"
}

output "nsg_id" {
  value       = azurerm_network_security_group.nsg.id
  description = "Valor de ID do NSG"
}