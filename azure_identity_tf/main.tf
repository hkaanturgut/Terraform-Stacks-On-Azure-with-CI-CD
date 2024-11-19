# data about the current subscription
data "azurerm_subscription" "current" {}

# create an app registration
resource "azuread_application" "hcp_terraform" {
  display_name = "spn-${var.stack_name}"
}

# create a service principal for the app
resource "azuread_service_principal" "hcp_terraform" {
  client_id = azuread_application.hcp_terraform.client_id
}

# assign the contributor role for the service principal
resource "azurerm_role_assignment" "contributor" {
  scope                = data.azurerm_subscription.current.id
  principal_id         = azuread_service_principal.hcp_terraform.object_id
  role_definition_name = "Contributor"
}

# create federated identity credentials for **plan** operations
# for each deployment name
resource "azuread_application_federated_identity_credential" "plan" {
  for_each       = toset(var.deployment_names)
  application_id = azuread_application.hcp_terraform.id
  display_name   = "stack-deployment-${each.value}-plan"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://app.terraform.io"
  description    = "Plan operation for deployment '${each.value}'"
  subject = join(":", [
    "organization",
    var.organization_name,
    "project",
    var.project_name,
    "stack",
    var.stack_name,
    "deployment",
    each.value,
    "operation",
    "plan"
  ])
}

# create federated identity credentials for **apply** operations
# for each deployment name
resource "azuread_application_federated_identity_credential" "apply" {
  for_each       = toset(var.deployment_names)
  application_id = azuread_application.hcp_terraform.id
  display_name   = "stack-deployment-${each.value}-apply"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://app.terraform.io"
  description    = "Apply operation for deployment '${each.value}'"
  subject = join(":", [
    "organization",
    var.organization_name,
    "project",
    var.project_name,
    "stack",
    var.stack_name,
    "deployment",
    each.value,
    "operation",
    "apply"
  ])
}