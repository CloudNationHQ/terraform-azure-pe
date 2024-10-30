locals {
  endpoints = {
    for k, v in var.endpoints : k => {
      name                          = v.name
      location                      = var.location
      subnet_id                     = v.subnet_id
      custom_network_interface_name = try(v.custom_network_interface_name, null)
      private_dns_zone_ids          = try(v.private_dns_zone_ids, [])
      tags                          = try(v.tags, {})
      ip_configurations             = try(v.ip_configurations, {})

      private_service_connection = {
        name                              = k
        is_manual_connection              = try(v.is_manual_connection, false)
        private_connection_resource_id    = v.private_connection_resource_id
        subresource_names                 = v.subresource_names
        private_connection_resource_alias = try(v.private_connection_resource_alias, null)
        request_message                   = try(v.request_message, null)
      }
    }
  }
}
