resource "azurerm_resource_group" "resource_group" {
  name     = var.name_override == null ? lower(format("rg-%s-%s-%s", local.location_code, var.environment, var.workload)) : var.name_override
  location = var.location
  tags     = var.tags
}

