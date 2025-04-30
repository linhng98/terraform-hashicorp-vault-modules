variable "path" {
  description = "(Required) Path to mount the JWT/OIDC auth backend."
  type        = string
}

variable "type" {
  description = "(Optional) Type of auth backend. Should be one of jwt or oidc."
  type        = string
  default     = "jwt"
}

variable "description" {
  description = "(Optional) The description of the auth backend."
  type        = string
  default     = null
}

variable "oidc_discovery_url" {
  description = "(Optional) The OIDC Discovery URL, without any .well-known component (base path). Cannot be used in combination with jwt_validation_pubkeys."
  type        = string
  default     = null
}

variable "oidc_client_id" {
  description = "(Optional) Client ID used for OIDC backends."
  type        = string
  default     = null
}

variable "oidc_client_secret" {
  description = "(Optional) Client Secret used for OIDC backends."
  type        = string
  default     = null
}

variable "oidc_response_mode" {
  description = "(Optional) The response mode to be used in the OAuth2 request. Allowed values are query and form_post. Defaults to query. If using Vault namespaces, and oidc_response_mode is form_post, then namespace_in_state should be set to false."
  type        = string
  default     = "query"
}

variable "oidc_response_types" {
  description = "(Optional) List of response types to request. Allowed values are 'code' and 'id_token'. Defaults to ['code']. Note: id_token may only be used if oidc_response_mode is set to form_post."
  type        = list(string)
  default     = ["code"]
}

variable "jwks_url" {
  description = "(Optional) JWKS URL to use to authenticate signatures. Cannot be used with oidc_discovery_url or jwt_validation_pubkeys."
  type        = string
  default     = null
}

variable "jwks_ca_pem" {
  description = "(Optional) The CA certificate or chain of certificates, in PEM format, to use to validate connections to the JWKS URL. If not set, system certificates are used."
  type        = string
  default     = null
}

variable "oidc_discovery_ca_pem" {
  description = "(Optional) The CA certificate or chain of certificates, in PEM format, to use to validate connections to the OIDC Discovery URL. If not set, system certificates are used"
  type        = string
  default     = null
}

variable "jwt_validation_pubkeys" {
  description = "(Optional) A list of PEM-encoded public keys to use to authenticate signatures locally. Cannot be used in combination with oidc_discovery_url."
  type        = list(string)
  default     = null
}

variable "bound_issuer" {
  description = "(Optional) The value against which to match the iss claim in a JWT."
  type        = string
  default     = null
}

variable "jwt_supported_algs" {
  description = "(Optional) A list of supported signing algorithms. Vault 1.1.0 defaults to [RS256] but future or past versions of Vault may differ."
  type        = list(string)
  default     = ["RS256"]
}

variable "default_role" {
  description = "(Optional) The default role to use if none is provided during login."
  type        = string
  default     = null
}

variable "provider_config" {
  description = "(Optional) Provider specific handling configuration. All values may be strings, and the provider will convert to the appropriate type when configuring Vault."
  type        = any
  default     = null
}

variable "local" {
  description = "(Optional) Specifies if the auth method is local only."
  type        = string
  default     = null
}

variable "namespace_in_state" {
  description = "(Optional) Pass namespace in the OIDC state parameter instead of as a separate query parameter. With this setting, the allowed redirect URL(s) in Vault and on the provider side should not contain a namespace query parameter. This means only one redirect URL entry needs to be maintained on the OIDC provider side for all vault namespaces that will be authenticating against it. Defaults to true for new configs"
  type        = string
  default     = null
}

variable "tune" {
  description = "(Optional) Extra configuration block."
  type = object({
    default_lease_ttl            = optional(string, "768h")
    max_lease_ttl                = optional(string, "768h")
    audit_non_hmac_response_keys = optional(list(string))
    audit_non_hmac_request_keys  = optional(list(string))
    listing_visibility           = optional(string)
    passthrough_request_headers  = optional(list(string))
    allowed_response_headers     = optional(list(string))
    token_type                   = optional(string, "default-service")
  })
  default = null
}


variable "default_role_type" {
  description = "(Optional) Default role_type for all roles."
  type        = string
  default     = "oidc"
}

variable "default_bound_claims" {
  description = "(Optional) Default bound_claims for all roles."
  type        = map(string)
  default     = null
}

variable "default_user_claim" {
  description = "(Optional) Default user_claim for all roles."
  type        = string
  default     = null
}

variable "default_groups_claim" {
  description = "(Optional) Default groups_claim for all roles."
  type        = any
  default     = null
}

variable "default_bound_subject" {
  description = "(Optional) Default bound_subject for all roles."
  type        = string
  default     = null
}

variable "default_bound_claims_type" {
  description = "(Optional) Default bound_claims_type for all roles."
  type        = string
  default     = null
}

variable "default_claim_mappings" {
  description = "(Optional) Default claim_mappings for all roles."
  type        = map(string)
  default     = null
}

variable "default_allowed_redirect_uris" {
  description = "(Optional) Default allowed_redirect_uris for all roles."
  type        = list(string)
  default     = null
}

variable "default_oidc_scopes" {
  description = "(Optional) Default oidc_scopes for all roles."
  type        = list(string)
  default     = null
}

variable "default_token_policies" {
  description = "Default token_policies for all roles."
  type        = list(string)
  default     = []
}

variable "backend_roles" {
  description = "List of backend roles associate with this jwt auth"
  type = map(object({
    role_type               = optional(string, "oidc")
    bound_claims            = optional(map(string))
    user_claim              = optional(string, null)
    bound_subject           = optional(string)
    bound_claims_type       = optional(string, "string")
    claim_mappings          = optional(map(string))
    oidc_scopes             = optional(list(string))
    groups_claim            = optional(string)
    allowed_redirect_uris   = optional(list(string))
    clock_skew_leeway       = optional(number)
    expiration_leeway       = optional(number)
    not_before_leeway       = optional(number)
    max_age                 = optional(number)
    token_ttl               = optional(number)
    token_max_ttl           = optional(number)
    token_period            = optional(number)
    token_policies          = optional(list(string))
    token_bound_cidrs       = optional(list(string))
    token_explicit_max_ttl  = optional(number)
    token_no_default_policy = optional(bool)
    token_num_uses          = optional(number)
    token_type              = optional(string)
  }))
  default = {}
}
