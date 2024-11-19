

variable "demo_compute_resource_group" {
  type = object({
    environment = string
    location    = string
    tags        = map(string)
  })

}


variable "demo_storage_account" {
  type = object({
    account_tier             = string
    account_replication_type = string
  })

}