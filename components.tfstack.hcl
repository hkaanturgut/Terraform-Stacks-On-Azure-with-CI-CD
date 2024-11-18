component "demo_infra_stack_01" {
  source = "./stacks/infrastructure_compute"

  inputs = {
    demo_compute_resource_group = {
      environment = var.central_variables.environment
      location    = var.central_variables.location
      tags = var.central_variables.tags
    }

    demo_storage_account = {
      account_tier   = var.demo_storage_account.account_tier
      account_replication_type = var.demo_storage_account.account_replication_type
    }
  }

  providers = {
    azurerm = provider.azurerm.this
    random = provider.random.this
  }
}

component "demo_networking_stack_01" {
  source = "./stacks/networking"

  inputs = {
    demo_networking_resource_group = {
      environment = var.central_variables.environment
      location    = var.central_variables.location
      tags = var.central_variables.tags
    }

    demo_virtual_network = {
      cidr_range = var.demo_virtual_network.cidr_range
      tags = var.central_variables.tags

    }

    demo_subnet_01 = {
      address_prefixes = var.demo_subnet_01.address_prefixes
    }
  }

  providers = {
    azurerm = provider.azurerm.this
  }
}

