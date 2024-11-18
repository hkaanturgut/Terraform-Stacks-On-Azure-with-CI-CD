resource "azurerm_storage_account" "this" {
  name                = var.name_override == null ? lower(format("st%s%s%s", local.location_code, var.environment, var.workload)) : var.name_override
  resource_group_name = var.resource_group_name
  location            = var.location

  access_tier              = var.access_tier
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}
