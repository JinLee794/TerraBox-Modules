variable "display_name" {
  type        = string
  description = "Name of an existing resource group to deply the virtual network into."
}

variable "identifier_uris" {
  type        = list(string)
  description = "A set of user-defined URI(s) that uniquely identify an application within its Azure AD tenant, or within a verified custom domain if the application is multi-tenant."
  default     = []
}

variable "sign_in_audience" {
  type        = string
  description = "The Microsoft account types that are supported for the current application. Must be one of AzureADMyOrg, AzureADMultipleOrgs, AzureADandPersonalMicrosoftAccount or PersonalMicrosoftAccount. Defaults to AzureADMyOrg."
  default     = "AzureADMyOrg"
}

variable "tags" {
  type        = map(any)
  description = "Map of key value pairs for the resource tagging. Default: none."
  default     = {}
}
