component "demo_resource_group" {
  source = "./modules/resource_group"

  inputs = {

    environment = var.demo_resource_group.environment
    location    = var.demo_resource_group.location
    workload    = "compute"
    tags        = var.demo_resource_group.tags
  }

  providers = {
    azurerm = provider.azurerm.this
    random = provider.random.this
  }
}

component "demo_storage_account" {
  source = "./modules/storage_account"

  inputs = {

    environment              = component.demo_resource_group.outputs.environment
    location                 = component.demo_resource_group.outputs.location
    workload                 = "demo"
    resource_group_name      = component.demo_resource_group.outputs.name
    access_tier              = "Hot"
    account_tier             = var.demo_storage_account.account_tier
    account_replication_type = var.demo_storage_account.account_replication_type

  }

  providers = {
    azurerm = provider.azurerm.this
  }
}

