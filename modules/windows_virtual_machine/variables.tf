variable "name_override" {
  description = "Override name for the VM"
  type        = string
  default     = null
}

variable "location" {
  description = "The location for the resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}


variable "vm_size" {
  description = "The size of the VM"
  type        = string
}

variable "os_disk_caching" {
  description = "The caching setting of the OS disk"
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  description = "The storage account type of the OS disk"
  type        = string
  default     = "Standard_LRS"
}

variable "image_publisher" {
  description = "The publisher of the image"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "image_offer" {
  description = "The offer of the image"
  type        = string
  default     = "WindowsServer"
}

variable "image_sku" {
  description = "The SKU of the image"
  type        = string
  default     = "2019-Datacenter"
}

variable "image_version" {
  description = "The version of the image"
  type        = string
  default     = "latest"
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the VM"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
}

variable "ip_configuration_name" {
  description = "The name of the IP configuration"
  type        = string
  default     = "internal"
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "private_ip_address_allocation" {
  description = "The allocation method for the private IP address"
  type        = string
  default     = "Dynamic"
}

variable "environment" {
  description = "The environment for the resources"
  type        = string
}

variable "workload" {
  description = "The workload for the resources"
  type        = string
}