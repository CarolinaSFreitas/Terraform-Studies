output "storage_account_id" {
  description = "Valor do ID das Storage Account"
  value       = [for sa in azurerm_storage_account.storage_account : sa.id]
}

output "sa_primary_access_key" {
  description = "Chaves de acesso primária das Storage Account"
  value       = { for chave, sa in azurerm_storage_account.storage_account : chave => sa.primary_access_key }
  sensitive   = true
}

