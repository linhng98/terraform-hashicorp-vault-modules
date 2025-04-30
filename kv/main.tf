resource "vault_mount" "kv" {
  for_each = var.secrets_engines

  path                         = each.key
  namespace                    = try(each.value.namespace, null)
  type                         = try(each.value.type, "kv")
  options                      = merge(try(each.value.options, {}), { version = "2" })
  description                  = try(each.value.description, "")
  default_lease_ttl_seconds    = try(each.value.default_lease_ttl_seconds, null)
  max_lease_ttl_seconds        = try(each.value.max_lease_ttl_seconds, null)
  audit_non_hmac_response_keys = try(each.value.audit_non_hmac_response_keys, null)
  audit_non_hmac_request_keys  = try(each.value.audit_non_hmac_request_keys, null)
  local                        = try(each.value.local, null)
  seal_wrap                    = try(each.value.seal_wrap, null)
  external_entropy_access      = try(each.value.external_entropy_access, null)
  allowed_managed_keys         = try(each.value.allowed_managed_keys, null)
}

resource "vault_kv_secret_backend_v2" "kv" {
  for_each = var.secrets_engines

  namespace            = try(each.value.namespace, null)
  mount                = vault_mount.kv[each.key].path
  max_versions         = try(each.value.max_versions, null)
  delete_version_after = try(each.value.delete_version_after, null)
  cas_required         = try(each.value.cas_required, null)
}
