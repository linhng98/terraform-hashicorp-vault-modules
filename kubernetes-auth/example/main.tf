terraform {
  required_version = ">= 1.3.2"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.23.0"
    }
  }
}

module "vault_kubernetes" {
  source = "../"

  path = "test_eks"

  kubernetes_host    = "https://F938E83D50FAF92A130F96236364B267.yl4.us-west-2.eks.amazonaws.com"
  kubernetes_ca_cert = "-----BEGIN CERTIFICATE-----\nMIIDBTCCAe2gAwIBAgIIDEHePE9/LHkwDQYJKoZIhvcNAQELBQAwFTETMBEGA1UE\nAxMKa3ViZXJuZXRlczAeFw0yMzEwMTUxNDAzMDJaFw0zMzEwMTIxNDA4MDJaMBUx\nEzARBgNVBAMTCmt1YmVybmV0ZXMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK\nAoIBAQDrLjFjv5/upPjLKyrM//7rslWAoKm9Ihvwi8+7owkuLeYfqN6+1bsQ2Y4J\nFBOk/bAFnMIXzalBJRQu/Cz7/bivVbkjX1FKnHCjcgG4oqGSUboa1ngPtoQsChTT\nWyWxBw3oFFn0bk3lIp62f7zzljno3EuKoWKCTZrThpT9iHmFr7JTG3ApbBNWF7sn\npInBndfarA4wzevjGJP70Q9jrHS7obrBG6jxA/xAut33pER/3j74bG3sZTqBi56m\nKGSF0fVoGUJDv4TinzZnvmVcHDfswEjfPB5W3YfDZt+SdASCVxlFAy6VsJpzCN7c\nngf51uRa87Cxgoia5FWQw1GvnUxfAgMBAAGjWTBXMA4GA1UdDwEB/wQEAwICpDAP\nBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBQ12XO3J46j3J40LQjhKk/6cwdkwTAV\nBgNVHREEDjAMggprdWJlcm5ldGVzMA0GCSqGSIb3DQEBCwUAA4IBAQDBKRVQKmu3\nUmIbzsPwBMRRC4bb687YYNzTsxKeyx2XHD0TsdcuzX/p1Rl0RS/VH1vWirEqPYFE\nAo/EYlPEegpxskj79sPmt7xIliDTp75cnyc7Rio22ecEjjaaMm+Ddd0vF/T6THqe\n4jsax6nmCBka2Gn8eIfM4T3BtjyakT26S2S9kfGtXbPVMiM2SXLzTjTjiVwVN2C4\nUUJR4cpTYNRqskuSU6EEPopA/nc10Uba6VG8haPfJTfaTrvYkLB8qel17Azs2PKW\nQGjF1m9OCPR+fn3EdLE5br+0dgMXVZj6G9Kha6P160JmON8xCSsaagoy+qYPApK4\nL6x2VddYCRJ3\n-----END CERTIFICATE-----"

  backend_roles = {
    test = {
      bound_service_account_names      = ["vault-snapshot"]
      bound_service_account_namespaces = ["vault"]
      token_policies                   = ["vault-snapshotter-prod"]
    }
  }
}
