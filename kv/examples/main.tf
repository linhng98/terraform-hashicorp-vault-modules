terraform {
  required_version = ">= 1.3.2"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.23.0"
    }
  }
}


module "vault_secrets_engine_kv" {
  source = "../"

  secrets_engines = {
    test = {
      description = "test terraform"
    }
    test2 = {
      description = "test2 terraform"
    }
  }
}
