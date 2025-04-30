# Hashicorp Vault JWT/OIDC Backend and Roles Management
Terraform module which create Hashicorp Vault JWT/OIDC Backend and Role Management

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
| [vault_jwt_auth_backend.oidc](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend) | resource |
| [vault_jwt_auth_backend_role.role](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_roles"></a> [backend\_roles](#input\_backend\_roles) | List of backend roles associate with this jwt auth | <pre>map(object({<br>    role_type               = optional(string, "oidc")<br>    bound_claims            = optional(map(string))<br>    user_claim              = optional(string, null)<br>    bound_subject           = optional(string)<br>    bound_claims_type       = optional(string, "string")<br>    claim_mappings          = optional(map(string))<br>    oidc_scopes             = optional(list(string))<br>    groups_claim            = optional(string)<br>    allowed_redirect_uris   = optional(list(string))<br>    clock_skew_leeway       = optional(number)<br>    expiration_leeway       = optional(number)<br>    not_before_leeway       = optional(number)<br>    max_age                 = optional(number)<br>    token_ttl               = optional(number)<br>    token_max_ttl           = optional(number)<br>    token_period            = optional(number)<br>    token_policies          = optional(list(string))<br>    token_bound_cidrs       = optional(list(string))<br>    token_explicit_max_ttl  = optional(number)<br>    token_no_default_policy = optional(bool)<br>    token_num_uses          = optional(number)<br>    token_type              = optional(string)<br>  }))</pre> | `{}` | no |
| <a name="input_bound_issuer"></a> [bound\_issuer](#input\_bound\_issuer) | (Optional) The value against which to match the iss claim in a JWT. | `string` | `null` | no |
| <a name="input_default_allowed_redirect_uris"></a> [default\_allowed\_redirect\_uris](#input\_default\_allowed\_redirect\_uris) | (Optional) Default allowed\_redirect\_uris for all roles. | `list(string)` | `null` | no |
| <a name="input_default_bound_claims"></a> [default\_bound\_claims](#input\_default\_bound\_claims) | (Optional) Default bound\_claims for all roles. | `map(string)` | `null` | no |
| <a name="input_default_bound_claims_type"></a> [default\_bound\_claims\_type](#input\_default\_bound\_claims\_type) | (Optional) Default bound\_claims\_type for all roles. | `string` | `null` | no |
| <a name="input_default_bound_subject"></a> [default\_bound\_subject](#input\_default\_bound\_subject) | (Optional) Default bound\_subject for all roles. | `string` | `null` | no |
| <a name="input_default_claim_mappings"></a> [default\_claim\_mappings](#input\_default\_claim\_mappings) | (Optional) Default claim\_mappings for all roles. | `map(string)` | `null` | no |
| <a name="input_default_groups_claim"></a> [default\_groups\_claim](#input\_default\_groups\_claim) | (Optional) Default groups\_claim for all roles. | `any` | `null` | no |
| <a name="input_default_oidc_scopes"></a> [default\_oidc\_scopes](#input\_default\_oidc\_scopes) | (Optional) Default oidc\_scopes for all roles. | `list(string)` | `null` | no |
| <a name="input_default_role"></a> [default\_role](#input\_default\_role) | (Optional) The default role to use if none is provided during login. | `string` | `null` | no |
| <a name="input_default_role_type"></a> [default\_role\_type](#input\_default\_role\_type) | (Optional) Default role\_type for all roles. | `string` | `"oidc"` | no |
| <a name="input_default_token_policies"></a> [default\_token\_policies](#input\_default\_token\_policies) | Default token\_policies for all roles. | `list(string)` | `[]` | no |
| <a name="input_default_user_claim"></a> [default\_user\_claim](#input\_default\_user\_claim) | (Optional) Default user\_claim for all roles. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) The description of the auth backend. | `string` | `null` | no |
| <a name="input_jwks_ca_pem"></a> [jwks\_ca\_pem](#input\_jwks\_ca\_pem) | (Optional) The CA certificate or chain of certificates, in PEM format, to use to validate connections to the JWKS URL. If not set, system certificates are used. | `string` | `null` | no |
| <a name="input_jwks_url"></a> [jwks\_url](#input\_jwks\_url) | (Optional) JWKS URL to use to authenticate signatures. Cannot be used with oidc\_discovery\_url or jwt\_validation\_pubkeys. | `string` | `null` | no |
| <a name="input_jwt_supported_algs"></a> [jwt\_supported\_algs](#input\_jwt\_supported\_algs) | (Optional) A list of supported signing algorithms. Vault 1.1.0 defaults to [RS256] but future or past versions of Vault may differ. | `list(string)` | <pre>[<br>  "RS256"<br>]</pre> | no |
| <a name="input_jwt_validation_pubkeys"></a> [jwt\_validation\_pubkeys](#input\_jwt\_validation\_pubkeys) | (Optional) A list of PEM-encoded public keys to use to authenticate signatures locally. Cannot be used in combination with oidc\_discovery\_url. | `list(string)` | `null` | no |
| <a name="input_local"></a> [local](#input\_local) | (Optional) Specifies if the auth method is local only. | `string` | `null` | no |
| <a name="input_namespace_in_state"></a> [namespace\_in\_state](#input\_namespace\_in\_state) | (Optional) Pass namespace in the OIDC state parameter instead of as a separate query parameter. With this setting, the allowed redirect URL(s) in Vault and on the provider side should not contain a namespace query parameter. This means only one redirect URL entry needs to be maintained on the OIDC provider side for all vault namespaces that will be authenticating against it. Defaults to true for new configs | `string` | `null` | no |
| <a name="input_oidc_client_id"></a> [oidc\_client\_id](#input\_oidc\_client\_id) | (Optional) Client ID used for OIDC backends. | `string` | `null` | no |
| <a name="input_oidc_client_secret"></a> [oidc\_client\_secret](#input\_oidc\_client\_secret) | (Optional) Client Secret used for OIDC backends. | `string` | `null` | no |
| <a name="input_oidc_discovery_ca_pem"></a> [oidc\_discovery\_ca\_pem](#input\_oidc\_discovery\_ca\_pem) | (Optional) The CA certificate or chain of certificates, in PEM format, to use to validate connections to the OIDC Discovery URL. If not set, system certificates are used | `string` | `null` | no |
| <a name="input_oidc_discovery_url"></a> [oidc\_discovery\_url](#input\_oidc\_discovery\_url) | (Optional) The OIDC Discovery URL, without any .well-known component (base path). Cannot be used in combination with jwt\_validation\_pubkeys. | `string` | `null` | no |
| <a name="input_oidc_response_mode"></a> [oidc\_response\_mode](#input\_oidc\_response\_mode) | (Optional) The response mode to be used in the OAuth2 request. Allowed values are query and form\_post. Defaults to query. If using Vault namespaces, and oidc\_response\_mode is form\_post, then namespace\_in\_state should be set to false. | `string` | `"query"` | no |
| <a name="input_oidc_response_types"></a> [oidc\_response\_types](#input\_oidc\_response\_types) | (Optional) List of response types to request. Allowed values are 'code' and 'id\_token'. Defaults to ['code']. Note: id\_token may only be used if oidc\_response\_mode is set to form\_post. | `list(string)` | <pre>[<br>  "code"<br>]</pre> | no |
| <a name="input_path"></a> [path](#input\_path) | (Required) Path to mount the JWT/OIDC auth backend. | `string` | n/a | yes |
| <a name="input_provider_config"></a> [provider\_config](#input\_provider\_config) | (Optional) Provider specific handling configuration. All values may be strings, and the provider will convert to the appropriate type when configuring Vault. | `any` | `null` | no |
| <a name="input_tune"></a> [tune](#input\_tune) | (Optional) Extra configuration block. | <pre>object({<br>    default_lease_ttl            = optional(string, "768h")<br>    max_lease_ttl                = optional(string, "768h")<br>    audit_non_hmac_response_keys = optional(list(string))<br>    audit_non_hmac_request_keys  = optional(list(string))<br>    listing_visibility           = optional(string)<br>    passthrough_request_headers  = optional(list(string))<br>    allowed_response_headers     = optional(list(string))<br>    token_type                   = optional(string, "default-service")<br>  })</pre> | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | (Optional) Type of auth backend. Should be one of jwt or oidc. | `string` | `"jwt"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_path"></a> [backend\_path](#output\_backend\_path) | Backend path |
| <a name="output_roles"></a> [roles](#output\_roles) | List of roles and these role's policies |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module is maintained by DSO.
