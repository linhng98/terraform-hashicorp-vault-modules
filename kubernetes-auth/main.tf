resource "vault_auth_backend" "kubernetes" {
  type            = "kubernetes"
  namespace       = var.namespace
  path            = var.path
  disable_remount = var.disable_remount
  description     = var.description
  local           = var.local

  dynamic "tune" {
    for_each = var.tune != null ? [var.tune] : []

    content {
      default_lease_ttl            = try(tune.default_lease_ttl, null)
      max_lease_ttl                = try(tune.max_lease_ttl, null)
      audit_non_hmac_response_keys = try(tune.audit_non_hmac_response_keys, null)
      audit_non_hmac_request_keys  = try(tune.audit_non_hmac_request_keys, null)
      listing_visibility           = try(tune.listing_visibility, null)
      passthrough_request_headers  = try(tune.passthrough_request_headers, null)
      allowed_response_headers     = try(tune.allowed_response_headers, null)
      token_type                   = try(tune.token_type, null)
    }
  }
}

resource "vault_kubernetes_auth_backend_config" "kubernetes" {
  backend = vault_auth_backend.kubernetes.path

  namespace              = var.namespace
  kubernetes_host        = var.kubernetes_host
  kubernetes_ca_cert     = var.kubernetes_ca_cert
  token_reviewer_jwt     = var.token_reviewer_jwt
  pem_keys               = var.pem_keys
  issuer                 = var.issuer
  disable_iss_validation = var.disable_iss_validation
  disable_local_ca_jwt   = var.disable_local_ca_jwt
}

resource "vault_kubernetes_auth_backend_role" "kubernetes" {
  for_each = var.backend_roles

  namespace                        = try(each.value.namespace, null)
  backend                          = try(vault_auth_backend.kubernetes.path, null)
  role_name                        = try(each.value.role_name, each.key)
  bound_service_account_names      = try(each.value.bound_service_account_names, null)
  bound_service_account_namespaces = try(each.value.bound_service_account_namespaces, null)
  audience                         = try(each.value.audience, null)
  alias_name_source                = try(each.value.alias_name_source, null)
  token_max_ttl                    = try(each.value.token_max_ttl, null)
  token_ttl                        = try(each.value.token_ttl, null)
  token_policies                   = try(each.value.token_policies, [])
  token_period                     = try(each.value.token_period, null)
  token_bound_cidrs                = try(each.value.token_bound_cidrs, [])
  token_explicit_max_ttl           = try(each.value.token_explicit_max_ttl, null)
  token_no_default_policy          = try(each.value.token_no_default_policy, null)
  token_num_uses                   = try(each.value.token_num_uses, null)
  token_type                       = try(each.value.token_type, null)
}
