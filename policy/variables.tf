variable "egp_policies" {
  type = map(object({
    namespace         = optional(string)
    policy            = string
    enforcement_level = string
    paths             = list(string)
    })
  )
  default = {}
}

variable "password_policies" {
  type = map(object({
    namespace = optional(string)
    policy    = string
    })
  )
  default = {}
}

variable "policies" {
  type = map(object({
    namespace = optional(string)
    policy    = string
    })
  )
  default = {}
}

variable "rgp_policies" {
  type = map(object({
    namespace         = optional(string)
    policy            = string
    enforcement_level = string
    })
  )
  default = {}
}
