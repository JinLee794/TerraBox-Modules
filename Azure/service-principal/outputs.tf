# App Service Principal Outputs
// output "app_role_ids" {
//     value = azuread_service_principal.this.app_role_ids
// }

// output "application_id" {
//     value = azuread_service_principal.this.application_id
// }

output "object_id" {
  value = azuread_service_principal.this.object_id
}

# Application Outputs
output "app_role_ids" {
  value = azuread_application.this.app_role_ids
}
output "application_id" {
  value = azuread_application.this.application_id
}
output "disabled_by_microsoft" {
  value = azuread_application.this.disabled_by_microsoft
}
output "application_object_id" {
  value = azuread_application.this.object_id
}
