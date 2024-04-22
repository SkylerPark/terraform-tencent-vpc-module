variable "name" {
  description = "(필수) security group 이름."
  type        = string
  nullable    = false
}

variable "description" {
  description = "(선택) security group 설명."
  type        = string
  default     = null
}

variable "project_id" {
  description = "(필수) security group 이 적용될 Project ID. Default: 0"
  type        = number
  default     = 0
  nullable    = false
}

variable "ingress_rules" {
  description = <<EOF
  (선택) 수신에 대한 설정 `ingress_rules` 블록 내용.
    (필수) `action` - 수신 규칙 정책. `ACCEPT`, `DROP` 둘중 하나만 설정 가능.
    (필수) `protocol` - 규칙에 대한 protocol. `protocol` 이 `ALL` 로 됫을댄 모든 프로토콜로 정의 됩니다 `ALL`,`TCP`,`UDP`,`ICMP`.
    (필수) `port` - 포트 범위를 나타냅니다 `80`, `80-90`, `80,443` 과 같이 설정 가능.
    (선택) `ipv4_cidrs` - IPv4 에 대한 CIDR 리스트.
    (선택) `ipv6_cidrs` - IPv6에 대한 CIDR 리스트.
    (선택) `security_groups` - Security Group ID 리스트.
    (선택) `self` - self 보안그룹을 추가할 것인지 여부.
  EOF
  type = list(object({
    action          = string
    protocol        = string
    port            = string
    ipv4_cidrs      = optional(list(string), [])
    ipv6_cidrs      = optional(list(string), [])
    prefix_lists    = optional(list(string), [])
    security_groups = optional(list(string), [])
    self            = optional(bool, false)
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for rule in var.ingress_rules :
      anytrue([
        length(rule.ipv4_cidrs) > 0,
        length(rule.ipv6_cidrs) > 0,
        length(rule.security_groups) > 0,
        rule.self,
      ])
    ])
    error_message = "`ipv4_cidrs`, `ipv6_cidrs`, `security_groups` or `self` 중 하나 이상을 지정해야 합니다."
  }
}

variable "egress_rules" {
  description = <<EOF
  (선택) 수신에 대한 설정 `egress_rules` 블록 내용.
    (필수) `action` - 수신 규칙 정책. `ACCEPT`, `DROP` 둘중 하나만 설정 가능.
    (필수) `protocol` - 규칙에 대한 protocol. `protocol` 이 `ALL` 로 됫을댄 모든 프로토콜로 정의 됩니다 `ALL`,`TCP`,`UDP`,`ICMP`.
    (필수) `port` - 포트 범위를 나타냅니다 `80`, `80-90`, `80,443` 과 같이 설정 가능.
    (선택) `ipv4_cidrs` - IPv4 에 대한 CIDR 리스트.
    (선택) `ipv6_cidrs` - IPv6에 대한 CIDR 리스트.
    (선택) `security_groups` - Security Group ID 리스트.
    (선택) `self` - self 보안그룹을 추가할 것인지 여부.
  EOF
  type = list(object({
    action          = string
    protocol        = string
    port            = string
    ipv4_cidrs      = optional(list(string), [])
    ipv6_cidrs      = optional(list(string), [])
    prefix_lists    = optional(list(string), [])
    security_groups = optional(list(string), [])
    self            = optional(bool, false)
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for rule in var.egress_rules :
      anytrue([
        length(rule.ipv4_cidrs) > 0,
        length(rule.ipv6_cidrs) > 0,
        length(rule.security_groups) > 0,
        rule.self,
      ])
    ])
    error_message = "`ipv4_cidrs`, `ipv6_cidrs`, `security_groups` or `self` 중 하나 이상을 지정해야 합니다."
  }
}

variable "tags" {
  description = "(선택) 리소스 태그 내용"
  type        = map(string)
  default     = {}
}
