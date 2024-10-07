output "storage_account_eua_id" {
  description = "Valor do ID do Storage Account"
  value       = azurerm_storage_account.storage_account["eua"].id
}

output "storage_account_asia_id" {
  description = "Valor do ID do Storage Account"
  value       = azurerm_storage_account.storage_account["asia"].id
}

output "storage_account_brasil_id" {
  description = "Valor do ID do Storage Account"
  value       = azurerm_storage_account.storage_account["brasil"].id
}

output "sa_primary_access_key_eua" {
  description = "Chave de acesso primária do Storage Account"
  value       = azurerm_storage_account.storage_account["eua"].primary_access_key
  sensitive   = true
}

output "sa_primary_access_key_asia" {
  description = "Chave de acesso primária do Storage Account"
  value       = azurerm_storage_account.storage_account["asia"].primary_access_key
  sensitive   = true
}

output "sa_primary_access_key_brasil" {
  description = "Chave de acesso primária do Storage Account"
  value       = azurerm_storage_account.storage_account["brasil"].primary_access_key
  sensitive   = true
}
