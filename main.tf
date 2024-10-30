# private endpoints
resource "azurerm_private_endpoint" "endpoint" {
  for_each = local.endpoints

  name                          = each.value.name
  resource_group_name           = coalesce(lookup(var.endpoints, "resource_group", null), var.resource_group)
  location                      = coalesce(lookup(var.endpoints, "location", null), var.location)
  subnet_id                     = each.value.subnet_id
  custom_network_interface_name = try(each.value.custom_network_interface_name, null)
  tags                          = try(each.value.tags, var.tags, null)

  private_service_connection {
    name                              = each.value.private_service_connection.name
    is_manual_connection              = try(each.value.private_service_connection.is_manual_connection, false)
    private_connection_resource_id    = each.value.private_service_connection.private_connection_resource_id
    subresource_names                 = each.value.private_service_connection.subresource_names
    private_connection_resource_alias = try(each.value.private_connection_resource_alias, null)
  }

  dynamic "private_dns_zone_group" {
    for_each = length(try(each.value.private_dns_zone_ids, [])) > 0 ? [1] : []
    content {
      name                 = "default"
      private_dns_zone_ids = each.value.private_dns_zone_ids
    }
  }

  dynamic "ip_configuration" {
    for_each = each.value.ip_configurations
    content {
      name               = ip_configuration.value.name
      private_ip_address = ip_configuration.value.private_ip_address
      member_name        = try(ip_configuration.value.member_name, null)
      subresource_name   = try(ip_configuration.value.subresource_name, null)
    }
  }
}
