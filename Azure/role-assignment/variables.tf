variable "role_definition_id" {
  type        = string
  description = "The Scoped-ID of the Role Definition. Changing this forces a new resource to be created. Conflicts with role_definition_name."
}

variable "scope" {
  type        = string
  description = "The scope at which the Role Definition applies too, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM. It is recommended to use the first entry of the assignable_scopes. Changing this forces a new resource to be created."
}

variable "principal_id" {
  type        = string
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. Changing this forces a new resource to be created."
}
