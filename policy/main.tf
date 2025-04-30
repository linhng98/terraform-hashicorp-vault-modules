resource "vault_egp_policy" "this" {
  for_each = var.egp_policies

  name              = each.key
  namespace         = each.value.namespace
  policy            = each.value.policy
  paths             = each.value.policy.paths
  enforcement_level = each.value.policy.enforcement_level
}

resource "vault_password_policy" "this" {
  for_each = var.password_policies

  name      = each.key
  namespace = each.value.namespace
  policy    = each.value.policy
}

resource "vault_policy" "this" {
  for_each = var.policies

  name      = each.key
  namespace = each.value.namespace
  policy    = each.value.policy
}

resource "vault_rgp_policy" "this" {
  for_each = var.rgp_policies

  name              = each.key
  namespace         = each.value.namespace
  policy            = each.value.policy
  enforcement_level = each.value.policy.enforcement_level
}
