# Hashicorp Vault Kubernetes Backend and Role Management
Terraform module which create Hashicorp Vault Kubernetes Backend and Role Management

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
| [vault_auth_backend.kubernetes](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_kubernetes_auth_backend_config.kubernetes](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kubernetes_auth_backend_config) | resource |
| [vault_kubernetes_auth_backend_role.kubernetes](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kubernetes_auth_backend_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_roles"></a> [backend\_roles](#input\_backend\_roles) | List of roles to created in the Kubenetes backend | <pre>map(object({<br>    namespace                        = optional(string, null)<br>    role_name                        = optional(string, null)<br>    user_claim                       = optional(string, null)<br>    bound_service_account_names      = optional(list(string))<br>    bound_service_account_namespaces = optional(list(string))<br>    audience                         = optional(string)<br>    alias_name_source                = optional(string)<br>    token_ttl                        = optional(number)<br>    token_max_ttl                    = optional(number)<br>    token_period                     = optional(number)<br>    token_policies                   = optional(list(string))<br>    token_bound_cidrs                = optional(list(string))<br>    token_explicit_max_ttl           = optional(number)<br>    token_no_default_policy          = optional(bool)<br>    token_num_uses                   = optional(number)<br>    token_type                       = optional(string)<br>  }))</pre> | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) A description of the auth method. | `string` | `null` | no |
| <a name="input_disable_iss_validation"></a> [disable\_iss\_validation](#input\_disable\_iss\_validation) | (Optional) Disable JWT issuer validation. Allows to skip ISS validation. Requires Vault v1.5.4+ or Vault auth kubernetes plugin v0.7.1+ | `bool` | `null` | no |
| <a name="input_disable_local_ca_jwt"></a> [disable\_local\_ca\_jwt](#input\_disable\_local\_ca\_jwt) | (Optional) Disable defaulting to the local CA cert and service account JWT when running in a Kubernetes pod. Requires Vault v1.5.4+ or Vault auth kubernetes plugin v0.7.1+ | `bool` | `null` | no |
| <a name="input_disable_remount"></a> [disable\_remount](#input\_disable\_remount) | (Optional) If set, opts out of mount migration on path updates. | `string` | `null` | no |
| <a name="input_issuer"></a> [issuer](#input\_issuer) | (Optional) JWT issuer. If no issuer is specified, kubernetes.io/serviceaccount will be used as the default issuer. | `string` | `null` | no |
| <a name="input_kubernetes_ca_cert"></a> [kubernetes\_ca\_cert](#input\_kubernetes\_ca\_cert) | (Optional) PEM encoded CA cert for use by the TLS client used to talk with the Kubernetes API. | `string` | `null` | no |
| <a name="input_kubernetes_host"></a> [kubernetes\_host](#input\_kubernetes\_host) | (Required) Host must be a host string, a host:port pair, or a URL to the base of the Kubernetes API server. | `string` | n/a | yes |
| <a name="input_local"></a> [local](#input\_local) | (Optional) Specifies if the auth method is local only. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace to provision the resource in. The value should not contain leading or trailing forward slashes. The namespace is always relative to the provider's configured namespace. Available only for Vault Enterprise. | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | (Optional) The path to mount the auth method — this defaults to the name of the type. | `string` | `null` | no |
| <a name="input_pem_keys"></a> [pem\_keys](#input\_pem\_keys) | (Optional) List of PEM-formatted public keys or certificates used to verify the signatures of Kubernetes service account JWTs. If a certificate is given, its public key will be extracted. Not every installation of Kubernetes exposes these keys. | `list(string)` | `null` | no |
| <a name="input_token_reviewer_jwt"></a> [token\_reviewer\_jwt](#input\_token\_reviewer\_jwt) | (Optional) A service account JWT used to access the TokenReview API to validate other JWTs during login. If not set the JWT used for login will be used to access the API. | `string` | `null` | no |
| <a name="input_tune"></a> [tune](#input\_tune) | (Optional) Extra configuration block. | <pre>object({<br>    default_lease_ttl            = optional(string, "768h")<br>    max_lease_ttl                = optional(string, "768h")<br>    audit_non_hmac_response_keys = optional(list(string))<br>    audit_non_hmac_request_keys  = optional(list(string))<br>    listing_visibility           = optional(string)<br>    passthrough_request_headers  = optional(list(string))<br>    allowed_response_headers     = optional(list(string))<br>    token_type                   = optional(string, "default-service")<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_path"></a> [backend\_path](#output\_backend\_path) | Backend path |
| <a name="output_roles"></a> [roles](#output\_roles) | List of roles and these role's policies |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module is maintained by DSO.
