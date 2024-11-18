output "name" {
  value = azurerm_resource_group.resource_group.name
}

output "id" {
  value = azurerm_resource_group.resource_group.id
}

output "location" {
  value = azurerm_resource_group.resource_group.location
}


output "environment" {
  value = var.environment
}