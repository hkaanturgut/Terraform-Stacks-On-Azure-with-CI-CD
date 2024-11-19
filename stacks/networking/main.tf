module "demo_networking_resource_group" {
  source = "../../modules/resource_group"

  environment = var.demo_networking_resource_group.environment
  location    = var.demo_networking_resource_group.location
  workload    = "network"
  tags        = var.demo_networking_resource_group.tags

}

module "demo_virtual_network" {
  source = "../../modules/virtual_network"

  location            = module.demo_networking_resource_group.location
  cidr_range          = var.demo_virtual_network.cidr_range
  tags                = var.demo_virtual_network.tags
  resource_group_name = module.demo_networking_resource_group.name
  environment         = module.demo_networking_resource_group.environment
  workload            = "demo"
}


module "demo_subnet_01" {
  source = "../../modules/subnet"

  address_prefixes    = var.demo_subnet_01.address_prefixes
  virtual_network_name = module.demo_virtual_network.name
  resource_group_name = module.demo_networking_resource_group.name
  environment         = module.demo_virtual_network.environment
  workload            = "demo"
  
}