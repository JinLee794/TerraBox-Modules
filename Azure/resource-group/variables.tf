variable "resource_group_name" {
  type        = string
  description = "Name of an existing resource group to deply the virtual network into."
}

variable "location" {
  type        = string
  description = "The Azure region to deploy to. Recommendation is to set to the same location as the resource group."
}

variable "tags" {
  type        = map(any)
  description = "Map of key value pairs for the resource tagging. Default: none."
  default     = {}
}
