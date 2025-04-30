output "backend_path" {
  description = "Backend path"
  value       = vault_auth_backend.kubernetes.path
}

output "roles" {
  description = "List of roles and these role's policies"
  value = {
    for k, v in vault_kubernetes_auth_backend_role.kubernetes :
    v.role_name => v.token_policies
  }
}
