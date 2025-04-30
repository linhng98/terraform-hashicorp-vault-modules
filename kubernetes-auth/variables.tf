variable "namespace" {
  description = "The namespace to provision the resource in. The value should not contain leading or trailing forward slashes. The namespace is always relative to the provider's configured namespace. Available only for Vault Enterprise."
  type        = string
  default     = null
}

variable "path" {
  description = "(Optional) The path to mount the auth method — this defaults to the name of the type."
  type        = string
  default     = null
}

variable "disable_remount" {
  description = "(Optional) If set, opts out of mount migration on path updates."
  type        = string
  default     = null
}

variable "description" {
  description = "(Optional) A description of the auth method."
  type        = string
  default     = null
}

variable "local" {
  description = "(Optional) Specifies if the auth method is local only."
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

variable "kubernetes_host" {
  description = "(Required) Host must be a host string, a host:port pair, or a URL to the base of the Kubernetes API server."
  type        = string
}

variable "kubernetes_ca_cert" {
  description = "(Optional) PEM encoded CA cert for use by the TLS client used to talk with the Kubernetes API."
  type        = string
  default     = null
}

variable "token_reviewer_jwt" {
  description = "(Optional) A service account JWT used to access the TokenReview API to validate other JWTs during login. If not set the JWT used for login will be used to access the API."
  type        = string
  default     = null
}

variable "pem_keys" {
  description = "(Optional) List of PEM-formatted public keys or certificates used to verify the signatures of Kubernetes service account JWTs. If a certificate is given, its public key will be extracted. Not every installation of Kubernetes exposes these keys."
  type        = list(string)
  default     = null
}

variable "issuer" {
  description = "(Optional) JWT issuer. If no issuer is specified, kubernetes.io/serviceaccount will be used as the default issuer."
  type        = string
  default     = null
}

variable "disable_iss_validation" {
  description = "(Optional) Disable JWT issuer validation. Allows to skip ISS validation. Requires Vault v1.5.4+ or Vault auth kubernetes plugin v0.7.1+"
  type        = bool
  default     = null
}

variable "disable_local_ca_jwt" {
  description = "(Optional) Disable defaulting to the local CA cert and service account JWT when running in a Kubernetes pod. Requires Vault v1.5.4+ or Vault auth kubernetes plugin v0.7.1+"
  type        = bool
  default     = null
}

variable "backend_roles" {
  description = "List of roles to created in the Kubenetes backend"
  type = map(object({
    namespace                        = optional(string, null)
    role_name                        = optional(string, null)
    user_claim                       = optional(string, null)
    bound_service_account_names      = optional(list(string))
    bound_service_account_namespaces = optional(list(string))
    audience                         = optional(string)
    alias_name_source                = optional(string)
    token_ttl                        = optional(number)
    token_max_ttl                    = optional(number)
    token_period                     = optional(number)
    token_policies                   = optional(list(string))
    token_bound_cidrs                = optional(list(string))
    token_explicit_max_ttl           = optional(number)
    token_no_default_policy          = optional(bool)
    token_num_uses                   = optional(number)
    token_type                       = optional(string)
  }))
  default = null
}
