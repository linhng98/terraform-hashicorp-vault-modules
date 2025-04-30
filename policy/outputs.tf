output "egp_policies" {
  value = {
    for k, v in vault_egp_policy.this : k => v
  }
}
output "password_policies" {
  value = {
    for k, v in vault_password_policy.this : k => v
  }
}
output "policies" {
  value = {
    for k, v in vault_policy.this : k => v
  }
}
output "rgp_policies" {
  value = {
    for k, v in vault_rgp_policy.this : k => v
  }
}
