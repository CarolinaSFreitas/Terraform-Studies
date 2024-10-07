output "vm_ip" {
  description = "Valor do IP público da VM"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}
