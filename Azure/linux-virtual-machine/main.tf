data "azurerm_key_vault" "this" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_resource_group_name
}

data "azurerm_key_vault_secret" "ssh_pub_key" {
  name         = var.ssh_public_key_name
  key_vault_id = data.azurerm_key_vault.this.id
}


resource "azurerm_network_interface" "this" {
  name                = var.env == "dev" ? "${var.name}-eni" : "${var.env}-${var.name}-eni"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  availability_set_id = var.availability_set_id

  disable_password_authentication = false

  size           = var.size
  admin_username = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.this.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = data.azurerm_key_vault_secret.ssh_pub_key.value
  }

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

  # Custom images from SIG
  // storage_image_reference {
  //   id = "<ID of Image>"
  // }

  tags = var.tags
}
