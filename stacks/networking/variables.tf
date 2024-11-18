variable "demo_networking_resource_group" {
  type = object({
    environment = string
    location    = string
    tags        = map(string)
  })

}

variable "demo_virtual_network" {
  type = object({
    cidr_range  = string
    tags        = map(string)
  })
}

variable "demo_subnet_01" {
  type = object({
    address_prefixes = list(string)
  })
  
}