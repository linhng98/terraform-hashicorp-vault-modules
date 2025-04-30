# Hashicorp Vault KV Secrets Engines
Terraform module which create Hashicorp Vault KV secrets engines (KV version 2).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.2 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 3.23.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | >= 3.23.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_kv_secret_backend_v2.kv](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kv_secret_backend_v2) | resource |
| [vault_mount.kv](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_secrets_engines"></a> [secrets\_engines](#input\_secrets\_engines) | value | <pre>map(object({<br>    namespace                    = optional(string, null)<br>    type                         = optional(string, "kv")<br>    options                      = optional(any, null)<br>    description                  = optional(string, "")<br>    default_lease_ttl_seconds    = optional(number, null)<br>    max_lease_ttl_seconds        = optional(number, null)<br>    audit_non_hmac_response_keys = optional(list(string), null)<br>    audit_non_hmac_request_keys  = optional(list(string), null)<br>    local                        = optional(bool, null)<br>    seal_wrap                    = optional(bool, null)<br>    external_entropy_access      = optional(bool, null)<br>    allowed_managed_keys         = optional(list(string), null)<br>    max_versions                 = optional(number, null)<br>    cas_required                 = optional(bool, null)<br>    delete_version_after         = optional(number, null)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kv_paths"></a> [kv\_paths](#output\_kv\_paths) | List of paths and their descriptions |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module is maintained by DSO.
