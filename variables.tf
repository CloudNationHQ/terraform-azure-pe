variable "endpoints" {
  description = "Contains all private endpoint configuration"
  type = map(object({
    name                          = string
    subnet_id                     = string
    resource_group_name           = optional(string)
    location                      = optional(string)
    custom_network_interface_name = optional(string)
    tags                          = optional(map(string))
    private_service_connection = object({
      name                              = optional(string)
      is_manual_connection              = optional(bool, false)
      private_connection_resource_id    = optional(string)
      subresource_names                 = optional(list(string))
      private_connection_resource_alias = optional(string)
      request_message                   = optional(string)
    })
    private_dns_zone_group = optional(object({
      name                 = optional(string)
      private_dns_zone_ids = list(string)
    }))
    ip_configurations = optional(map(object({
      name               = optional(string)
      private_ip_address = string
      member_name        = optional(string)
      subresource_name   = optional(string)
    })), {})
  }))
}

variable "location" {
  description = "default azure region to be used."
  type        = string
  default     = null

  validation {
    condition     = var.location != null || alltrue([for k, v in var.endpoints : lookup(v, "location", null) != null])
    error_message = "location must be set either on each endpoint or as the outer global."
  }
}

variable "resource_group_name" {
  description = "default resource group to be used."
  type        = string
  default     = null

  validation {
    condition     = var.resource_group_name != null || alltrue([for k, v in var.endpoints : lookup(v, "resource_group_name", null) != null])
    error_message = "resource_group_name must be set either on each endpoint or as the outer global."
  }
}

variable "tags" {
  description = "tags to be added to the resources"
  type        = map(string)
  default     = {}
}
