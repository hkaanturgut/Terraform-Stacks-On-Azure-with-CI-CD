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

    azurerm_provider = {
      identity_token = identity_token.azurerm.jwt
      client_id = "d6b170b8-2a1d-4bde-b68f-824b48060a6a"
      subscription_id = "e8760043-8652-49f9-b487-4b27daf3ec7a"
      tenant_id = "1a93b615-8d62-418a-ac28-22501cf1f978"
    }
  }
}


deployment "production" {
  inputs = {
    
    demo_resource_group = {
      environment = "prod"
      location = "canadacentral"
      tags = {
        environment = "production"
      }
    }
    demo_storage_account = {
      account_tier = "Premium"
      account_replication_type = "GZRS"
    }

    demo_networking_resource_group = {
      environment = "prod"
      location = "canadacentral"
      tags = {
        environment = "production"
      }
    }

    demo_virtual_network = {
      cidr_range = "10.0.0.0/17"
  
      tags = {
        environment = "production"
      }
  }
      
      demo_subnet_01 = {
        address_prefixes = ["10.0.16.0/21"]  
  }
    azurerm_provider = {
      identity_token = identity_token.azurerm.jwt
      client_id = "4da1b2e4-e4a3-4fe1-9ecb-869d400a884d"
      subscription_id = "cfd475e4-2732-4ec6-b819-5580d3656b25"
      tenant_id = "1a93b615-8d62-418a-ac28-22501cf1f978"
    } 
  }
}