output "configuration" {
  value = {
    client_id       = azuread_service_principal.hcp_terraform.client_id
    tenant_id       = data.azurerm_subscription.current.tenant_id
    subscription_id = data.azurerm_subscription.current.subscription_id
  }
}
