This example illustrates the configuration of static ip addresses for private endpoints

## Usage

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
      name                           = module.naming.private_endpoint.name
      subnet_id                      = module.network.subnets.sn1.id
      private_connection_resource_id = azurerm_storage_account.sa.id
      private_dns_zone_ids           = [module.private_dns.zones.blob.id]
      subresource_names              = ["blob"]
      ip_configurations = {
        vault = {
          name               = "blob"
          subresource_name   = "blob"
          private_ip_address = "10.19.1.6"
          member_name        = "default"
        }
      }
    }
  }
}
```
