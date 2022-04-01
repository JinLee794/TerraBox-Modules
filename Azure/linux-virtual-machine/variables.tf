variable "name" {
  description = "Name for a single VM. Use 'names' for multiple VMs. "
  type        = string
  default     = ""
}

variable "env" {
  description = "Environment code. Accepted values of 'dev', 'uat', 'qa', 'prod'."
  type        = string

  validation {
    condition     = contains(["dev", "uat", "qa", "prod"], var.env)
    error_message = "Invalid environment provided. Accepted values are: 'dev', 'uat', 'qa', 'prod'."
  }
}

variable "availability_set_id" {
  description = "(Optional) The ID of the Availability Set in which the Virtual Machine should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "size" {
  description = "Size of the VM"
  type        = string

  # Allow only D, E, and F-series VMs
  validation {
    condition = can(regex(
      "^Standard_[DEF][a-z0-9_-]+",
      var.size
    ))
    error_message = "The VM 'size' value must be of type D, E, or F. e.g (Standard_Dsv3)."
  }
}

variable "admin_username" {
  description = "Name for admin account to initialize the vm with."
  type        = string
}

variable "key_vault_name" {
  description = "Name of the keyvault that holds vm secrets."
  type        = string
}

variable "key_vault_resource_group_name" {
  description = "Name of the keyvault resource group."
  type        = string
}

variable "ssh_public_key_name" {
  description = "Name of the secret that holds the public ssh key inside the keyvault."
  type        = string
  default     = ""
}

variable "source_image_reference" {
  description = "Standard image reference block for platform images. Do not use if specifying a custom source_image_id."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = null
}

variable "source_image_id" {
  type        = string
  description = "(Optional) The ID of the Image which this Virtual Machine should be created from. Changing this forces a new resource to be created."
  default     = ""
}

variable "resource_group_name" {
  type        = string
  description = "Name of an existing resource group to deply the virtual network into."
}

variable "location" {
  type        = string
  description = "The Azure region to deploy to. Recommendation is to set to the same location as the resource group."
  default     = ""
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

# If attempting enforce tagging, see source_image_reference (line 54) variable to see how
variable "tags" {
  description = "Pre-formatted tags to apply toe the VM. See https://docs.microsoft.com/en-us/azure/virtual-machines/linux/using-tags for more information."
  type = object({
    BusinessUnit        = string
    OperationsTeam      = string
    BusinessCriticality = string
    DataClassification  = string
    WorkloadName        = string
  })
}
