variable "deployment_names" {
  type        = list(string)
  description = "List of Terraform stack deployment names"
}

variable "organization_name" {
  type        = string
  description = "HCP Terraform organization name"
}

variable "project_name" {
  type        = string
  description = "HCP Terraform project name"
}

variable "stack_name" {
  type        = string
  description = "Terraform stack name"
}
