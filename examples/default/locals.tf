locals {
  naming = {
    # lookup outputs to have consistent naming
    for type in local.naming_types : type => lookup(module.naming, type).name
  }

  naming_types = ["subnet", "network_security_group"]
}

locals {
  endpoints = {
    blob = {
      name                           = "pe-demo-dev-blob"
      subnet_id                      = module.network.subnets.sn1.id
      private_connection_resource_id = module.storage.account.id
      private_dns_zone_ids           = [module.private_dns.zones.vault.id]
      subresource_names              = ["blob"]
    }
    table = {
      name                           = "pe-demo-dev-table"
      subnet_id                      = module.network.subnets.sn1.id
      private_connection_resource_id = module.storage.account.id
      private_dns_zone_ids           = [module.private_dns.zones.table.id]
      subresource_names              = ["table"]
    }
  }
}
