variable "vpc_id" {
  description = "(필수) 서브넷을 생성할 VPC ID."
  type        = string
  nullable    = false
}

variable "subnets" {
  description = <<EOF
  (필수) 서브넷 그룹. Each block of `subnets` 블록 내용.
    (선택) `type` - Subnet 타입을 지정 가능한 설정값 `DUALSTACK` or `IPV6`. Default: `DUALSTACK`.
    (선택) `availability_zone` - Subnet 에 대한 가용영역.
    (선택) `ipv4_cidr` - subnet IPV4 CIDR.
    (선택) `ipv6_cidr` - subnet IPV6 CIDR.
  EOF
  type = map(object({
    type = optional(string, "IPV4")

    availability_zone = optional(string)
    ipv4_cidr         = optional(string)
    ipv6_cidr         = optional(string)
  }))
  nullable = false

  validation {
    condition     = length(keys(var.subnets)) > 0
    error_message = "하나 이상의 서브넷을 설정 해야합니다."
  }

  validation {
    condition = alltrue([
      for subnet in values(var.subnets) :
      contains(["IPV4", "IPV6"], subnet.type)
    ])
    error_message = "`type` 필드는 `IPV4` or `IPV6` 중 하나만 설정 해야합니다."
  }
}

variable "is_multicast" {
  description = "Subnet 멀티캐스트 활성화 여부. Default: false"
  type        = bool
  default     = false
}

variable "tags" {
  description = "(선택) 리소스 태그 내용"
  type        = map(string)
  default     = {}
}
