output "vm_01_ip" {
  description = "Valor do IP Público da VM"
  value       = aws_instance.vm_01.public_ip
}

output "vm_02_ip" {
  description = "Valor do IP Público da VM"
  value       = aws_instance.vm_02.public_ip
}