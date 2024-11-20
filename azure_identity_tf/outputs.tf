output "configuration" {
  value = {
    for sub_id, sub_name in var.subscriptions : sub_id => {
      client_id       = azuread_service_principal.hcp_terraform[sub_id].client_id
      tenant_id       = data.azurerm_subscription.current[sub_id].tenant_id
      subscription_id = data.azurerm_subscription.current[sub_id].subscription_id
    }
  }
}
