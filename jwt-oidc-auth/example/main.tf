terraform {
  required_version = ">= 1.3.2"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.23.0"
    }
  }
}

module "vault_oidc_role" {
  source = "../"

  path               = "oidc"
  oidc_client_id     = ""
  oidc_client_secret = ""
  oidc_discovery_url = ""
  default_user_claim = "preferred_username"
  default_allowed_redirect_uris = [
    "http://localhost:8250/oidc/callback",
    "https://vault.dso.cinnamon.is/ui/vault/auth/oidc/oidc/callback"
  ]
  default_oidc_scopes = [
    "https://graph.microsoft.com/.default",
    "email",
    "openid",
    "profile"
  ]

  backend_roles = {
    "yong" = {
      token_policies = ["admin"]
      bound_claims = {
        preferred_username = "Yong@cinnamon.is"
      }
    },
  }
}
