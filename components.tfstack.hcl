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

component "demo_windows_vm" {
  source = "./modules/windows_virtual_machine"

  inputs = {
    environment           = component.demo_resource_group.environment
    location              = component.demo_resource_group.location
    resource_group_name   = component.demo_resource_group.name
    virtual_network_name  = component.demo_virtual_network.name
    subnet_id             = component.demo_subnet_01.id
    vm_size               = var.demo_windows_vm.vm_size
    admin_username        = var.demo_windows_vm.admin_username
    admin_password        = var.demo_windows_vm.admin_password
    os_disk_caching       = var.demo_windows_vm.os_disk_caching
    os_disk_storage_account_type = var.demo_windows_vm.os_disk_storage_account_type
    image_publisher       = var.demo_windows_vm.image_publisher
    image_offer           = var.demo_windows_vm.image_offer
    image_sku             = var.demo_windows_vm.image_sku
    image_version         = var.demo_windows_vm.image_version
    ip_configuration_name = var.demo_windows_vm.ip_configuration_name
    private_ip_address_allocation = var.demo_windows_vm.private_ip_address_allocation
    workload            = "demo"
    tags                  = var.demo_windows_vm.tags
  }

  providers = {
    azurerm = provider.azurerm.this
  }
}