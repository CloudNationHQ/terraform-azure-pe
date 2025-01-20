# Changelog

## [1.4.1](https://github.com/CloudNationHQ/terraform-azure-pe/compare/v1.4.0...v1.4.1) (2025-01-20)


### Bug Fixes

* Make location optional on main level ([#33](https://github.com/CloudNationHQ/terraform-azure-pe/issues/33)) ([8e0e585](https://github.com/CloudNationHQ/terraform-azure-pe/commit/8e0e585ff79b887b75538c46b6dc7adb815e9ed5))

## [1.4.0](https://github.com/CloudNationHQ/terraform-azure-pe/compare/v1.3.0...v1.4.0) (2025-01-20)


### Features

* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#29](https://github.com/CloudNationHQ/terraform-azure-pe/issues/29)) ([1ed3deb](https://github.com/CloudNationHQ/terraform-azure-pe/commit/1ed3deb5f84d28dcb8ca60a3fce16dd24ec7551b))
* **deps:** bump golang.org/x/crypto from 0.21.0 to 0.31.0 in /tests ([#27](https://github.com/CloudNationHQ/terraform-azure-pe/issues/27)) ([77f2868](https://github.com/CloudNationHQ/terraform-azure-pe/commit/77f28689ef5adf768b6381bc2140afd58d54102d))
* **deps:** bump golang.org/x/net from 0.23.0 to 0.33.0 in /tests ([#32](https://github.com/CloudNationHQ/terraform-azure-pe/issues/32)) ([0eb3977](https://github.com/CloudNationHQ/terraform-azure-pe/commit/0eb3977f5d3225b78384f1e14a11d1dc81104007))
* remove temporary files when deployment tests fails ([#30](https://github.com/CloudNationHQ/terraform-azure-pe/issues/30)) ([d36e1af](https://github.com/CloudNationHQ/terraform-azure-pe/commit/d36e1afd739b1ef1d5ea40751dd4ea08ec5aba1e))

## [1.3.0](https://github.com/CloudNationHQ/terraform-azure-pe/compare/v1.2.0...v1.3.0) (2024-12-06)


### Features

* small refactor, added type definitions and incremented module versions ([#25](https://github.com/CloudNationHQ/terraform-azure-pe/issues/25)) ([ee2414f](https://github.com/CloudNationHQ/terraform-azure-pe/commit/ee2414f7e6a6923e1321e4846fd3595895ae94f1))

## [1.2.0](https://github.com/CloudNationHQ/terraform-azure-pe/compare/v1.1.3...v1.2.0) (2024-11-11)


### Features

* enhance testing with sequential, parallel modes and flags for exceptions and skip-destroy ([#23](https://github.com/CloudNationHQ/terraform-azure-pe/issues/23)) ([02c6ab2](https://github.com/CloudNationHQ/terraform-azure-pe/commit/02c6ab2c2eff8a1fe41c231516c9510f0719b6ed))

## [1.1.3](https://github.com/CloudNationHQ/terraform-azure-pe/compare/v1.1.2...v1.1.3) (2024-10-30)


### Bug Fixes

* fix locals to include request message ([#21](https://github.com/CloudNationHQ/terraform-azure-pe/issues/21)) ([d1e252e](https://github.com/CloudNationHQ/terraform-azure-pe/commit/d1e252ef8ce0d2e52e97f43e4e9bb139c2ca6752))

## [1.1.2](https://github.com/CloudNationHQ/terraform-azure-pe/compare/v1.1.1...v1.1.2) (2024-10-30)


### Bug Fixes

* add request message parameter to private service connection ([#19](https://github.com/CloudNationHQ/terraform-azure-pe/issues/19)) ([68165c2](https://github.com/CloudNationHQ/terraform-azure-pe/commit/68165c2096feac9e4b67a91ff04fb1fc49206d3f))

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
