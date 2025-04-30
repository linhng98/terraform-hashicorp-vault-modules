output "kv_paths" {
  description = "List of paths and their descriptions"
  value = {
    for k, v in vault_mount.kv :
    v.path => v.description
  }
}
