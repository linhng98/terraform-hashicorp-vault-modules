output "backend_path" {
  description = "Backend path"
  value       = vault_jwt_auth_backend.oidc.path
}

output "roles" {
  description = "List of roles and these role's policies"
  value = {
    for k, v in vault_jwt_auth_backend_role.role :
    v.role_name => v.token_policies
  }
}
