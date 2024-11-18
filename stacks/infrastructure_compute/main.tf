module "demo_compute_resource_group" {
  source = "../../modules/resource_group"

  environment = var.demo_compute_resource_group.environment
  location    = var.demo_compute_resource_group.location
  workload    = "compute"
  tags        = var.demo_compute_resource_group.tags

}


module "demo_storage_account" {
  source = "../../modules/storage_account"

  environment              = module.demo_compute_resource_group.environment
  location                 = module.demo_compute_resource_group.location
  workload                 = "demo"
  resource_group_name      = module.demo_compute_resource_group.name
  access_tier              = "Hot"
  account_tier             = var.demo_storage_account.account_tier
  account_replication_type = var.demo_storage_account.account_replication_type
}