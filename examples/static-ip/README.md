# Static Ip

This deploys the configuration for static ip addresses for private endpoints

## Types

```hcl
resource_group = string
location       = string
endpoints = map(object({
  name                           = string
  subnet_id                      = string
  private_connection_resource_id = string
  private_dns_zone_ids           = list(string)
  subresource_names              = list(string)
  ip_configurations = optional(map(object({
    name               = string
    private_ip_address = string
    subresource_name   = string
    member_name        = string
  })))
}))
```
