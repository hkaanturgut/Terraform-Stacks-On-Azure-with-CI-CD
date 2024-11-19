identity_token "azurerm" {
  audience = [ "api://AzureADTokenExchange" ]
}

deployment "development" {
  inputs = {

    central_variables = {
      environment = "dev"
      location = "canadacentral"
      tags = {
        environment = "development"
      }
    }

    demo_storage_account = {
      account_tier = "Standard"
      account_replication_type = "LRS"
    }


    demo_virtual_network = {
      cidr_range = "10.0.0.0/16"
    }

    demo_subnet_01 = {
      address_prefixes = ["10.0.16.0/20"]
    }

    azurerm_provider = {
      identity_token = identity_token.azurerm.jwt
      client_id = "71c3fec4-f5e5-4f5d-a4da-a85750002db8"
      subscription_id = "e8760043-8652-49f9-b487-4b27daf3ec7a"
      tenant_id = "1a93b615-8d62-418a-ac28-22501cf1f978"
    }
  }
}

deployment "production" {
  inputs = {
    central_variables = {
      environment = "prod"
      location = "canadacentral"
      tags = {
        environment = "production"
      }
    }

    demo_storage_account = {
      account_tier = "Standard"
      account_replication_type = "GZRS"
    }


    demo_virtual_network = {
      cidr_range = "10.0.0.0/17"
    }

    demo_subnet_01 = {
      address_prefixes = ["10.0.16.0/21"]
    }

    azurerm_provider = {
      identity_token = identity_token.azurerm.jwt
      client_id = "9df36718-14c5-4956-9a67-5d89e052895b"
      subscription_id = "cfd475e4-2732-4ec6-b819-5580d3656b25"
      tenant_id = "1a93b615-8d62-418a-ac28-22501cf1f978"
    }
  }
}


# orchestrate "auto_approve" "safe_plans" {
#   check {
#     # Ensure that no resources are being removed
#     condition = context.plan.changes.remove == 0
#     reason    = "Plan has ${context.plan.changes.remove} resources to be removed."
#   }

#   check {
#     # Ensure that changes are applyable
#     condition = context.plan.applyable
#     reason    = "Changes are not applyable"
#   }
# }
