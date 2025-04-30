variable "secrets_engines" {
  description = "value"
  type = map(object({
    namespace                    = optional(string, null)
    type                         = optional(string, "kv")
    options                      = optional(any, null)
    description                  = optional(string, "")
    default_lease_ttl_seconds    = optional(number, null)
    max_lease_ttl_seconds        = optional(number, null)
    audit_non_hmac_response_keys = optional(list(string), null)
    audit_non_hmac_request_keys  = optional(list(string), null)
    local                        = optional(bool, null)
    seal_wrap                    = optional(bool, null)
    external_entropy_access      = optional(bool, null)
    allowed_managed_keys         = optional(list(string), null)
    max_versions                 = optional(number, null)
    cas_required                 = optional(bool, null)
    delete_version_after         = optional(number, null)
  }))
}
