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
      name                              = optional(string, "default")
      is_manual_connection              = optional(bool, false)
      private_connection_resource_id    = optional(string)
      subresource_names                 = optional(list(string))
      private_connection_resource_alias = optional(string)
      request_message                   = optional(string)
    })
    private_dns_zone_group = optional(object({
      name                 = optional(string, "default")
      private_dns_zone_ids = list(string)
    }))
    ip_configurations = optional(map(object({
      name               = optional(string)
      private_ip_address = string
      member_name        = optional(string)
      subresource_name   = optional(string)
    })), {})
  }))

  validation {
    condition = alltrue([
      for k, v in var.endpoints : !(
        v.private_service_connection.private_connection_resource_id != null &&
        v.private_service_connection.private_connection_resource_alias != null
      )
    ])
    error_message = "Cannot specify both private_connection_resource_id and private_connection_resource_alias in the same endpoint."
  }

  validation {
    condition = alltrue([
      for k, v in var.endpoints : !v.private_service_connection.is_manual_connection || (
        v.private_service_connection.request_message != null &&
        length(trimspace(v.private_service_connection.request_message)) > 0
      )
    ])
    error_message = "Request message is required and cannot be empty when is_manual_connection is true."
  }

  validation {
    condition = alltrue([
      for k, v in var.endpoints : v.private_service_connection.subresource_names == null || (
        length(v.private_service_connection.subresource_names) > 0 &&
        alltrue([for name in v.private_service_connection.subresource_names : length(trimspace(name)) > 0])
      )
    ])
    error_message = "Subresource names cannot be empty strings when specified."
  }

  validation {
    condition = alltrue([
      for k, v in var.endpoints : v.private_dns_zone_group == null || (
        length(v.private_dns_zone_group.private_dns_zone_ids) > 0 &&
        length(v.private_dns_zone_group.private_dns_zone_ids) <= 5
      )
    ])
    error_message = "Private DNS zone group must have between 1 and 5 DNS zone IDs when specified."
  }

  validation {
    condition = alltrue([
      for k, v in var.endpoints : alltrue([
        for ip_k, ip_v in v.ip_configurations : can(cidrhost("${ip_v.private_ip_address}/32", 0))
      ])
    ])
    error_message = "All private IP addresses in ip_configurations must be valid IPv4 addresses."
  }
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
