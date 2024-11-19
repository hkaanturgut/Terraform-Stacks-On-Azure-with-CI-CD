variable "cidr_range" {
  description = "CIDR range for the vnet"
  type        = string
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"

}

variable "name_override" {
  type        = string
  description = "Name override for the resource group"
  default     = null

}
variable "workload" {
  type        = string
  description = "Resource type to be stored in the resource group"

}
variable "location" {
  type        = string
  description = "Azure location"
  validation {
    condition     = contains(["canadacentral", "canadaeast"], var.location)
    error_message = "Location must be canadacentral or canadaeast"
  }
}

variable "environment" {
  type        = string
  description = "Environment for the resources"
  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be dev or prod"
  }

}
variable "tags" {
  type        = map(string)
  description = "Tags for the resources"

}

