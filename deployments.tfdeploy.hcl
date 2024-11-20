identity_token "azurerm" {
  audience = [ "api://AzureADTokenExchange" ]
}

deployment "development" {
  inputs = {
    
    demo_resource_group = {
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

    demo_networking_resource_group = {
      environment = "dev"
      location = "canadacentral"
      tags = {
        environment = "development"
      }
    }


    demo_virtual_network = {
      cidr_range = "10.0.0.0/16"
      tags = {
        environment = "development"
      }
    }

    demo_subnet_01 = {
      address_prefixes = ["10.0.16.0/20"]
    }

    demo_windows_vm = {
      vm_size                       = "Standard_DS1_v2"
      admin_username                = "adminuser"
      admin_password                = "P@ssw0rd1234!"
      os_disk_caching               = "ReadWrite"
      os_disk_storage_account_type  = "Standard_LRS"
      image_publisher               = "MicrosoftWindowsServer"
      image_offer                   = "WindowsServer"
      image_sku                     = "2019-Datacenter"
      image_version                 = "latest"
      network_interfaces            = {
        nic1 = {}
      }
      ip_configuration_name         = "internal"
      private_ip_address_allocation = "Dynamic"
      tags                          = {
        environment = "demo"
        workload    = "compute"
      }
}

    azurerm_provider = {
      identity_token = identity_token.azurerm.jwt
      client_id = "5a116ab5-7932-43ad-83da-1ac2913be5ee"
      subscription_id = "e8760043-8652-49f9-b487-4b27daf3ec7a"
      tenant_id = "1a93b615-8d62-418a-ac28-22501cf1f978"
    }
  }
}


# deployment "production" {
#   inputs = {
    
#     demo_resource_group = {
#       environment = "prod"
#       location = "canadacentral"
#       tags = {
#         environment = "production"
#       }
#     }
#     demo_storage_account = {
#       account_tier = "Premium"
#       account_replication_type = "GZRS"
#     }

#     demo_networking_resource_group = {
#       environment = "prod"
#       location = "canadacentral"
#       tags = {
#         environment = "production"
#       }
#     }

#     demo_virtual_network = {
#       cidr_range = "10.0.0.0/17"
  
#       tags = {
#         environment = "production"
#       }
#   }
      
#       demo_subnet_01 = {
#         address_prefixes = ["10.0.16.0/21"]  
#   }
#     azurerm_provider = {
#       identity_token = identity_token.azurerm.jwt
#       client_id = "cab57bbf-ce87-45df-b7ed-aadf69a99eb1"
#       subscription_id = "cfd475e4-2732-4ec6-b819-5580d3656b25"
#       tenant_id = "1a93b615-8d62-418a-ac28-22501cf1f978"
#     } 
#   }
# }

orchestrate "auto_approve" "safe_plans" {
  check {
    # Ensure that no resources are being removed
    condition = context.plan.changes.remove == 0
    reason    = "Plan has ${context.plan.changes.remove} resources to be removed."
  }

  check {
    # Ensure that changes are applyable
    condition = context.plan.applyable
    reason    = "Changes are not applyable"
  }
}