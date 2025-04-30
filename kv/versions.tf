terraform {
  required_version = ">= 1.3.2"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.23.0"
    }
  }
}
