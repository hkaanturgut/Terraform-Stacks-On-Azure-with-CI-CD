
# Data about the current subscriptions
data "azurerm_subscription" "current" {
  for_each        = var.subscriptions
  subscription_id = each.key
}


# create an app registration for each subscription
resource "azuread_application" "hcp_terraform" {
  for_each     = var.subscriptions
  display_name = "spn-${var.stack_name}-${each.value}"
}

# create a service principal for each app
resource "azuread_service_principal" "hcp_terraform" {
  for_each  = var.subscriptions
  client_id = azuread_application.hcp_terraform[each.key].client_id
}

# assign the contributor role for each service principal
resource "azurerm_role_assignment" "contributor" {
  for_each             = var.subscriptions
  scope                = "/subscriptions/${each.key}"
  principal_id         = azuread_service_principal.hcp_terraform[each.key].object_id
  role_definition_name = "Contributor"
}

# create federated identity credentials for **plan** operations
# for each deployment name and subscription
resource "azuread_application_federated_identity_credential" "plan" {
  for_each = { for sub, name in var.subscriptions : sub => name }

  application_id = azuread_application.hcp_terraform[each.key].id
  display_name   = "stack-${each.value}-plan"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://app.terraform.io"
  description    = "Plan operation for subscription '${each.value}'"
  subject = join(":", [
    "organization",
    var.organization_name,
    "project",
    var.project_name,
    "stack",
    var.stack_name,
    "subscription",
    each.value,
    "operation",
    "plan"
  ])
}

# create federated identity credentials for **apply** operations
# for each deployment name and subscription
resource "azuread_application_federated_identity_credential" "apply" {
  for_each = { for sub, name in var.subscriptions : sub => name }

  application_id = azuread_application.hcp_terraform[each.key].id
  display_name   = "stack-${each.value}-apply"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://app.terraform.io"
  description    = "Apply operation for subscription '${each.value}'"
  subject = join(":", [
    "organization",
    var.organization_name,
    "project",
    var.project_name,
    "stack",
    var.stack_name,
    "subscription",
    each.value,
    "operation",
    "apply"
  ])
}

