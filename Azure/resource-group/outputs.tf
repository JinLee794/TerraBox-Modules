output "id" {
  value = azurerm_resource_group.this.id
}

output "name" {
  value = regex("/resourceGroups/([a-zA-Z0-9]+)", azurerm_resource_group.this.id)[0]
}

output "location" {
  value = var.location
}
