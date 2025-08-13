# Private Endpoints

This terraform module simplifies setting up private endpoints, enabling secure and private access to azure services with customizable options. It offers an efficient way to enhance network security and connectivity through code.

## Features

Multi endpoint creation for expanded connectivity

Ability to set multiple static IPs on a single endpoint

Utilization of terratest for robust validation

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 4.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (~> 4.0)

## Resources

The following resources are used by this module:

- [azurerm_private_endpoint.endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_endpoints"></a> [endpoints](#input\_endpoints)

Description: Contains all private endpoint configuration

Type:

```hcl
map(object({
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
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_location"></a> [location](#input\_location)

Description: default azure region to be used.

Type: `string`

Default: `null`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: default resource group to be used.

Type: `string`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: tags to be added to the resources

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_endpoints"></a> [endpoints](#output\_endpoints)

Description: Contains all private endpoint configuration
<!-- END_TF_DOCS -->

## Goals

For more information, please see our [goals and non-goals](./GOALS.md).

## Testing

For more information, please see our testing [guidelines](./TESTING.md)

## Notes

Using a dedicated module, we've developed a naming convention for resources that's based on specific regular expressions for each type, ensuring correct abbreviations and offering flexibility with multiple prefixes and suffixes.

Full examples detailing all usages, along with integrations with dependency modules, are located in the examples directory.

To update the module's documentation run `make doc`

## Contributors

We welcome contributions from the community! Whether it's reporting a bug, suggesting a new feature, or submitting a pull request, your input is highly valued.

For more information, please see our contribution [guidelines](./CONTRIBUTING.md). <br><br>

<a href="https://github.com/cloudnationhq/terraform-azure-pe/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=cloudnationhq/terraform-azure-pe" />
</a>

## License

MIT Licensed. See [LICENSE](./LICENSE) for full details.

## References

- [Documentation](https://learn.microsoft.com/en-us/azure/private-link/)
- [Rest Api](https://learn.microsoft.com/en-us/rest/api/virtualnetwork/private-endpoints)
- [Rest Api Specs](https://github.com/Azure/azure-rest-api-specs/blob/main/specification/network/resource-manager/Microsoft.Network/stable/2023-09-01/privateEndpoint.json)
