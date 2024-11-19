variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"

}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"

}

variable "address_prefixes" {
  type        = list(string)
  description = "List of address prefixes for the subnet"

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
variable "environment" {
  type        = string
  description = "Environment for the resources"
  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be dev or prod"
  }

}