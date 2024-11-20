resource "azurerm_network_interface" "network_interface" {
  name                = var.name_override == null ? lower(format("nic-%s-%s-%s", local.location_code, var.environment, var.workload)) : var.name_override
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}

resource "azurerm_windows_virtual_machine" "windows_virtual_machine" {
  name                = var.name_override == null ? lower(format("vm-%s-%s-%s", local.location_code, var.environment, var.workload)) : var.name_override
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = [ azurerm_network_interface.network_interface.id ]
  size                = var.vm_size

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  admin_username = var.admin_username
  admin_password = var.admin_password

  tags = var.tags

  depends_on = [ azurerm_network_interface.network_interface ]
}

