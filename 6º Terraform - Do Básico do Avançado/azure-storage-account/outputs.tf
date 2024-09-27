output "storage_account_id" {
  description = "Valor do ID do Storage Account"
  value       = azurerm_storage_account.sa-exemplo.id
}

output "sa_primary_access_key" {
  description = "Chave de acesso primária do Storage Account"
  value       = azurerm_storage_account.sa-exemplo.primary_access_key
  sensitive   = true
}
