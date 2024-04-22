variable "name" {
  description = "(필수) VPC 이름"
  type        = string
  nullable    = false
}

variable "dns_servers" {
  description = "(선택) VPC 의 DNS 목록. 목록에는 0~5개의 서버를 지정가능."
  type        = list(string)
  default     = []

  validation {
    condition     = length(var.dns_servers) > 0 || length(var.dns_servers) < 5
    error_message = "DNS 서버는 0~5 까지 지정 가능합니다."
  }
}

variable "is_multicast" {
  description = "VPC 멀티캐스트 활성화 여부. Default: false"
  type        = bool
  default     = false
}

variable "ipv4_cidrs" {
  description = <<EOF
    (필수) IPv4 CIDR 리스트.
      (선택) `cidr` - VPC CIDR block between /16 and /28
  EOF
  type = list(object({
    cidr = optional(string)
  }))
  default  = []
  nullable = false

  validation {
    condition     = length(var.ipv4_cidrs) > 0
    error_message = "CIDR 이 1개이상 필요합니다."
  }
}

variable "ipv6_cidrs" {
  description = <<EOF
    (필수) IPv4 CIDR 리스트.
      (선택) `cidr` - VPC CIDR block between /16 and /28
  EOF
  type = list(object({
    cidr = optional(string)
  }))
  default  = []
  nullable = false
}

variable "tags" {
  description = "(선택) 리소스 태그 내용"
  type        = map(string)
  default     = {}
}
