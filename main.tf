# private endpoints
resource "azurerm_private_endpoint" "this" {
  for_each = var.endpoints

  resource_group_name = coalesce(
    each.value.resource_group_name, var.resource_group_name
  )

  location = coalesce(
    each.value.location, var.location
  )

  name                          = each.value.name
  subnet_id                     = each.value.subnet_id
  custom_network_interface_name = each.value.custom_network_interface_name

  tags = coalesce(
    each.value.tags, var.tags
  )

  private_service_connection {
    is_manual_connection              = each.value.private_service_connection.is_manual_connection
    private_connection_resource_id    = each.value.private_service_connection.private_connection_resource_id
    subresource_names                 = each.value.private_service_connection.subresource_names
    private_connection_resource_alias = each.value.private_service_connection.private_connection_resource_alias
    request_message                   = each.value.private_service_connection.request_message
    name                              = coalesce(each.value.private_service_connection.name, each.key)
  }

  dynamic "private_dns_zone_group" {
    for_each = each.value.private_dns_zone_group != null ? { "this" = each.value.private_dns_zone_group } : {}

    content {
      name                 = coalesce(private_dns_zone_group.value.name, each.key)
      private_dns_zone_ids = private_dns_zone_group.value.private_dns_zone_ids
    }
  }

  dynamic "ip_configuration" {
    for_each = each.value.ip_configurations

    content {
      name = coalesce(
        ip_configuration.value.name, ip_configuration.key
      )

      private_ip_address = ip_configuration.value.private_ip_address
      member_name        = ip_configuration.value.member_name
      subresource_name   = ip_configuration.value.subresource_name
    }
  }
}
