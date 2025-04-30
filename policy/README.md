# terraform-hashicorp-vault-policy

Terraform module to create hashicorp vault policies

# Docs
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_egp_policy.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/egp_policy) | resource |
| [vault_password_policy.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/password_policy) | resource |
| [vault_policy.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_rgp_policy.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/rgp_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_egp_policies"></a> [egp\_policies](#input\_egp\_policies) | n/a | <pre>map(object({<br>    namespace         = optional(string)<br>    policy            = string<br>    enforcement_level = string<br>    paths             = list(string)<br>    })<br>  )</pre> | `{}` | no |
| <a name="input_password_policies"></a> [password\_policies](#input\_password\_policies) | n/a | <pre>map(object({<br>    namespace = optional(string)<br>    policy    = string<br>    })<br>  )</pre> | `{}` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | n/a | <pre>map(object({<br>    namespace = optional(string)<br>    policy    = string<br>    })<br>  )</pre> | `{}` | no |
| <a name="input_rgp_policies"></a> [rgp\_policies](#input\_rgp\_policies) | n/a | <pre>map(object({<br>    namespace         = optional(string)<br>    policy            = string<br>    enforcement_level = string<br>    })<br>  )</pre> | `{}` | no |

## Outputs

No outputs.
