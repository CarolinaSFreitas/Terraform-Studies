output "vm_ip" {
  description = "Valor do IP Público da VM"
  value       = aws_instance.vm.public_ip
}