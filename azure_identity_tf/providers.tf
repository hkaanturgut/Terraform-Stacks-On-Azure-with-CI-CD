terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0.2"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azuread" {}

provider "azurerm" {
  subscription_id = "e8760043-8652-49f9-b487-4b27daf3ec7a"
  features {}
}