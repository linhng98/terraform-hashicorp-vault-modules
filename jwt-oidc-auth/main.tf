resource "vault_jwt_auth_backend" "oidc" {
  description            = var.description
  path                   = var.path
  type                   = var.type
  oidc_discovery_url     = var.oidc_discovery_url
  oidc_discovery_ca_pem  = var.oidc_discovery_ca_pem
  oidc_client_id         = var.oidc_client_id
  oidc_client_secret     = var.oidc_client_secret
  oidc_response_mode     = var.oidc_response_mode
  oidc_response_types    = var.oidc_response_types
  jwks_url               = var.jwks_url
  jwks_ca_pem            = var.jwks_ca_pem
  jwt_validation_pubkeys = var.jwt_validation_pubkeys
  bound_issuer           = var.bound_issuer
  jwt_supported_algs     = var.jwt_supported_algs
  default_role           = var.default_role

  provider_config = var.provider_config
  local           = var.local

  namespace_in_state = var.namespace_in_state

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

resource "vault_jwt_auth_backend_role" "role" {
  for_each = var.backend_roles

  backend                 = vault_jwt_auth_backend.oidc.path
  role_name               = each.key
  role_type               = try(coalesce(each.value.role_type, var.default_role_type), null)
  bound_claims            = try(coalesce(each.value.bound_claims, var.default_bound_claims), null)
  user_claim              = try(coalesce(each.value.user_claim, var.default_user_claim), null)
  bound_subject           = try(coalesce(each.value.bound_subject, var.default_bound_subject), null)
  bound_claims_type       = try(coalesce(each.value.bound_claims_type, var.default_bound_claims_type), null)
  claim_mappings          = try(coalesce(each.value.claim_mappings, var.default_claim_mappings), null)
  oidc_scopes             = try(coalesce(each.value.oidc_scopes, var.default_oidc_scopes), null)
  groups_claim            = try(coalesce(each.value.groups_claim, var.default_groups_claim), null)
  allowed_redirect_uris   = try(coalesce(each.value.allowed_redirect_uris, var.default_allowed_redirect_uris), null)
  clock_skew_leeway       = each.value.clock_skew_leeway
  expiration_leeway       = each.value.expiration_leeway
  not_before_leeway       = each.value.not_before_leeway
  max_age                 = each.value.max_age
  token_ttl               = each.value.token_ttl
  token_max_ttl           = each.value.token_max_ttl
  token_period            = each.value.token_period
  token_policies          = concat(each.value.token_policies, var.default_token_policies)
  token_bound_cidrs       = each.value.token_bound_cidrs
  token_explicit_max_ttl  = each.value.token_explicit_max_ttl
  token_no_default_policy = each.value.token_no_default_policy
  token_num_uses          = each.value.token_num_uses
  token_type              = each.value.token_type
}
