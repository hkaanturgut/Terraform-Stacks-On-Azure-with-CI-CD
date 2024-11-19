required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "~> 4.0"
  }

  random = {
    source  = "hashicorp/random"
    version = "~> 3.6.3"
  }
}

provider "azurerm" "this" {
  config {
    features {}
    use_cli         = false
    use_oidc        = true
    oidc_token      = var.azurerm_provider.identity_token
    client_id       = var.azurerm_provider.client_id
    subscription_id = var.azurerm_provider.subscription_id
    tenant_id       = var.azurerm_provider.tenant_id
  }
}

provider "random" "this" {}
