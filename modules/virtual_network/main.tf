resource "azurerm_virtual_network" "virtual_network" {
  name                = var.name_override == null ? lower(format("vnet-%s-%s-%s", local.location_code, var.environment, var.workload)) : var.name_override
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = [var.cidr_range]

  tags = var.tags
}

