variable "subscriptions" {
  description = "Map of subscription IDs to names"
  type        = map(string)
}

variable "deployment_names" {
  description = "List of deployment names"
  type        = list(string)
}

variable "organization_name" {
  description = "Organization name"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "stack_name" {
  description = "Stack name"
  type        = string
}