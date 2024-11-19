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


    # demo_virtual_network = {
    #   cidr_range = "10.0.0.0/16"
    # }

    # demo_subnet_01 = {
    #   address_prefixes = ["10.0.16.0/20"]
    # }

    azurerm_provider = {
      identity_token = identity_token.azurerm.jwt
      client_id = "1a493a19-46a6-44d0-8033-43530f6b6823"
      subscription_id = "e8760043-8652-49f9-b487-4b27daf3ec7a"
      tenant_id = "1a93b615-8d62-418a-ac28-22501cf1f978"
    }
  }
}

# 
