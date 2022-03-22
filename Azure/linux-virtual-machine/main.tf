// data "azurerm_subnet" "this" {
//   name                 = var.subnet_name
//   virtual_network_name = "production"
//   resource_group_name  = "networking"
// }

resource "azurerm_network_interface" "this" {
  name                = "${var.name}-eni"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  name                            = var.name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  admin_password                  = var.admin_password
  disable_password_authentication = false
  // admin_ssh_key {
  //   username   = var.admin_username
  //   public_key = file(var.ssh_public_key)
  // }

  size           = var.size
  admin_username = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.this.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.source_image_reference["publisher"]
    offer     = var.source_image_reference["offer"]
    sku       = var.source_image_reference["sku"]
    version   = var.source_image_reference["version"]
  }

  tags = var.tags
}
