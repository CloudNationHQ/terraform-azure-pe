# private endpoints
resource "azurerm_private_endpoint" "endpoint" {
  for_each = {
    for k, v in var.endpoints : k => merge(v, {
      location             = var.location
      private_dns_zone_ids = try(v.private_dns_zone_ids, [])
      tags                 = try(v.tags, {})
      ip_configurations    = try(v.ip_configurations, {})
    })
  }

  name                          = each.value.name
  resource_group_name           = coalesce(lookup(var.endpoints, "resource_group", null), var.resource_group)
  location                      = each.value.location
  subnet_id                     = each.value.subnet_id
  custom_network_interface_name = try(each.value.custom_network_interface_name, null)
  tags                          = each.value.tags

  private_service_connection {
    name                              = each.key
    is_manual_connection              = try(each.value.is_manual_connection, false)
    private_connection_resource_id    = each.value.private_connection_resource_id
    subresource_names                 = each.value.subresource_names
    private_connection_resource_alias = try(each.value.private_connection_resource_alias, null)
    request_message                   = try(each.value.request_message, null)
  }

  dynamic "private_dns_zone_group" {
    for_each = length(each.value.private_dns_zone_ids) > 0 ? [1] : []

    content {
      name                 = "default"
      private_dns_zone_ids = each.value.private_dns_zone_ids
    }
  }

  dynamic "ip_configuration" {
    for_each = try(
      each.value.ip_configurations, {}
    )

    content {
      name               = ip_configuration.value.name
      private_ip_address = ip_configuration.value.private_ip_address
      member_name        = try(ip_configuration.value.member_name, null)
      subresource_name   = try(ip_configuration.value.subresource_name, null)
    }
  }
}
