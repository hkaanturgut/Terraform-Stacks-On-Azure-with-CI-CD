output "vm_id" {
  description = "The ID of the Windows VM"
  value       = azurerm_windows_virtual_machine.windows_virtual_machine.id
}

output "vm_name" {
  description = "The name of the Windows VM"
  value       = azurerm_windows_virtual_machine.windows_virtual_machine.name
}

output "vm_private_ip" {
  description = "The private IP address of the Windows VM"
  value       = azurerm_network_interface.network_interface.private_ip_address
}