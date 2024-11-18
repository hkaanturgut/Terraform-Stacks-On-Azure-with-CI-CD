variable "environment" {
  type        = string
  description = "Prefix for the resources"

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

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure location for the resources"
}

variable "access_tier" {
  type        = string
  description = "Access tier for the storage account"
}

variable "account_tier" {
  type        = string
  description = "Account tier for the storage account"
}

variable "account_replication_type" {
  type        = string
  description = "Replication type for the storage account"
}