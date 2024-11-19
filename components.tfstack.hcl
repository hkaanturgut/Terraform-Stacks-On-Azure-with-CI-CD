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

    environment              = component.demo_resource_group.environment
    location                 = component.demo_resource_group.location
    workload                 = "demo"
    resource_group_name      = component.demo_resource_group.name
    access_tier              = "Hot"
    account_tier             = var.demo_storage_account.account_tier
    account_replication_type = var.demo_storage_account.account_replication_type

  }

  providers = {
    azurerm = provider.azurerm.this
  }
}

component "demo_networking_resource_group" {
  source = "./modules/resource_group"

  inputs = {

    environment = var.demo_networking_resource_group.environment
    location    = var.demo_networking_resource_group.location
    workload    = "network"
    tags        = var.demo_networking_resource_group.tags

  }

  providers = {
    azurerm = provider.azurerm.this
    random = provider.random.this
  }
  
}

component "demo_virtual_network" {
  source = "./modules/virtual_network"

  inputs = {

    location            = component.demo_networking_resource_group.location
    cidr_range          = var.demo_virtual_network.cidr_range
    tags                = var.demo_virtual_network.tags
    resource_group_name = component.demo_networking_resource_group.name
    environment         = component.demo_networking_resource_group.environment
    workload            = "demo"
  }

  providers = {
    azurerm = provider.azurerm.this
  }
  
}

component "demo_subnet_01" {
  source = "./modules/subnet"

  inputs = {

    address_prefixes    = var.demo_subnet_01.address_prefixes
    virtual_network_name = component.demo_virtual_network.name
    resource_group_name = component.demo_networking_resource_group.name
    environment         = component.demo_virtual_network.environment
    workload            = "demo"
    
  }

  providers = {
    azurerm = provider.azurerm.this
  }
  
}

