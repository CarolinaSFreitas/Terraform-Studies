output "ProdSubnet" {
    description = "ID da Subrede de Produção"
    value = azurerm_subnet.subnet1.id
}

output "DevSubnet" {
    description = "ID da Subrede de Desenvolvimento"
    value = azurerm_subnet.subnet2.id
}

