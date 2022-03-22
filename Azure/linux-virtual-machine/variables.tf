variable "name" {
  description = "Name for a single VM. Use 'names' for multiple VMs. "
  type        = string
  default     = ""
}

variable "size" {
  description = "Size of the VM"
  type        = string
  default     = ""
}

variable "admin_username" {
  description = "Name for admin account to initialize the vm with."
  type        = string
  default     = ""
}
variable "admin_password" {
  description = "Password for admin account to initialize the vm with."
  type        = string
}

variable "ssh_public_key" {
  description = "Local path to public key"
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

variable "tags" {
  type        = map(any)
  description = "Map of key value pairs for the resource tagging. Default: none."
  default     = {}
}
