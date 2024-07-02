This example illustrates the default private endpoint setup, in its simplest form.

## Usage: default

```hcl
module "privatelink" {
  source  = "cloudnationhq/pe/azure"
  version = "~> 0.3"

  resourcegroup = module.rg.groups.demo.name
  location      = module.rg.groups.demo.location

  endpoints = {
    blob = {
      name                           = module.naming.private_endpoint.name
      subnet_id                      = module.network.subnets.sn1.id
      private_connection_resource_id = module.storage.account.id
      private_dns_zone_ids           = [module.private_dns.zones.blob.id]
      subresource_names              = ["blob"]
    }
  }
}
```

## Usage: multiple

Additionally, for certain scenarios, the example below highlights the ability to use multiple endpoints, enabling a broader setup.

```hcl
module "private_endpoint" {
  source  = "cloudnationhq/pe/azure"
  version = "~> 0.1"

  resourcegroup = module.rg.groups.demo.name
  location      = module.rg.groups.demo.location

  endpoints = local.endpoints
}
```

The module uses the below locals for configuration:

```hcl
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
```
