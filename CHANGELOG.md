# Changelog

## [1.1.1](https://github.com/CloudNationHQ/terraform-azure-pe/compare/v1.1.0...v1.1.1) (2024-10-30)


### Bug Fixes

* fixed manual connection property in private service connection ([#17](https://github.com/CloudNationHQ/terraform-azure-pe/issues/17)) ([41dc14e](https://github.com/CloudNationHQ/terraform-azure-pe/commit/41dc14eb63dbdad72a5448ad7c8086baff630341))

## [1.1.0](https://github.com/CloudNationHQ/terraform-azure-pe/compare/v1.0.0...v1.1.0) (2024-10-11)


### Features

* auto generated docs and refine makefile ([#15](https://github.com/CloudNationHQ/terraform-azure-pe/issues/15)) ([205c55d](https://github.com/CloudNationHQ/terraform-azure-pe/commit/205c55df62a6109c8c87fe371d06748b55f6cd0b))
* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#14](https://github.com/CloudNationHQ/terraform-azure-pe/issues/14)) ([ac1a563](https://github.com/CloudNationHQ/terraform-azure-pe/commit/ac1a56389c0011b56c1dcd5b8e401047bd7899bb))

## [1.0.0](https://github.com/CloudNationHQ/terraform-azure-pe/compare/v0.4.0...v1.0.0) (2024-09-24)


### ⚠ BREAKING CHANGES

* Version 4 of the azurerm provider includes breaking changes.

### Features

* upgrade azurerm provider to v4 ([#12](https://github.com/CloudNationHQ/terraform-azure-pe/issues/12)) ([a0b0dd8](https://github.com/CloudNationHQ/terraform-azure-pe/commit/a0b0dd85b50af9ca57d0c1de5864b70d29e1b1eb))

### Upgrade from v0.4.0 to v1.0.0:

- Update module reference to: `version = "~> 1.0"`
- Rename properties in endpoints object:
  - resourcegroup -> resource_group
- Rename variable:
  - resourcegroup -> resource_group

## [0.4.0](https://github.com/CloudNationHQ/terraform-azure-pe/compare/v0.3.0...v0.4.0) (2024-08-28)


### Features

* update documentation ([#9](https://github.com/CloudNationHQ/terraform-azure-pe/issues/9)) ([0368b16](https://github.com/CloudNationHQ/terraform-azure-pe/commit/0368b16e47f6b499109231374c0aac27bfdcf085))

## [0.3.0](https://github.com/CloudNationHQ/terraform-azure-pe/compare/v0.2.0...v0.3.0) (2024-07-02)


### Features

* add issue template ([#8](https://github.com/CloudNationHQ/terraform-azure-pe/issues/8)) ([31566c9](https://github.com/CloudNationHQ/terraform-azure-pe/commit/31566c9083662fe9f056ce7f36926cbc403dcd99))
* create pull request template ([#6](https://github.com/CloudNationHQ/terraform-azure-pe/issues/6)) ([acb6fe2](https://github.com/CloudNationHQ/terraform-azure-pe/commit/acb6fe220242bfb07d5e96069096a60431a445f2))

## [0.2.0](https://github.com/CloudNationHQ/terraform-azure-pe/compare/v0.1.0...v0.2.0) (2024-03-15)


### Features

* update documentation ([#4](https://github.com/CloudNationHQ/terraform-azure-pe/issues/4)) ([d2ece61](https://github.com/CloudNationHQ/terraform-azure-pe/commit/d2ece61eefba1b328b51787d3e6e365db0945847))

## 0.1.0 (2024-03-14)


### Features

* add initial resources ([#2](https://github.com/CloudNationHQ/terraform-azure-pe/issues/2)) ([3b2e082](https://github.com/CloudNationHQ/terraform-azure-pe/commit/3b2e0823bf64b0a32df98e84775b0c14864c7d86))
