variable "endpoints" {
  description = "Contains all private endpoint configuration"
  type = map(object({
    name                          = string
    subnet_id                     = string
    resource_group_name           = optional(string, null)
    location                      = optional(string, null)
    custom_network_interface_name = optional(string, null)
    tags                          = optional(map(string), null)
    private_service_connection = object({
      name                              = optional(string, "default")
      is_manual_connection              = optional(bool, false)
      private_connection_resource_id    = optional(string, null)
      subresource_names                 = optional(list(string), null)
      private_connection_resource_alias = optional(string, null)
      request_message                   = optional(string, null)
    })
    private_dns_zone_group = optional(object({
      name                 = optional(string, "default")
      private_dns_zone_ids = list(string)
    }), null)
    ip_configurations = optional(map(object({
      name               = optional(string, null)
      private_ip_address = string
      member_name        = optional(string, null)
      subresource_name   = optional(string, null)
    })), {})
  }))
}

variable "location" {
  description = "default azure region to be used."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "default resource group to be used."
  type        = string
  default     = null
}

variable "tags" {
  description = "tags to be added to the resources"
  type        = map(string)
  default     = {}
}
