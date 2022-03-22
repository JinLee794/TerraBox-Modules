# Role Assignment Outputs
output "role_assignment_id" {
  value = azurerm_role_assignment.this.id
}

output "principal_type" {
  value = azurerm_role_assignment.this.principal_type
}
