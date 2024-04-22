variable "name" {
  description = "(필수) NAT Gateway 리소스 이름."
  type        = string
  nullable    = false
}

variable "vpc_id" {
  description = "(필수) NAT Gateway 를 생성할 VPC ID."
  type        = string
  nullable    = false
}

variable "subnet_id" {
  description = "(필수) NAT Gateway 를 생성 할 Subnet ID."
  type        = string
  nullable    = false
}

variable "network" {
  description = <<EOF
  (선택) NAT Gateway 의 Network 설정 `network` 블록 내용.
    (선택) `bandwidth` - NAT Gateway 의 Network Bandwidth 값 유효한값 `20`,50`,`100`,`200`,`500`,`1000`,`2000`,`5000` Defaults: 100
    (선택) `concurrent` - NAT Gateway 의 동시 연결 제한 유효한값 `1000000`,`3000000`,`10000000` Defaults: 1000000
  EOF
  type = object({
    bandwidth  = optional(number, 100)
    concurrent = optional(number, 1000000)
  })
  default  = {}
  nullable = false

  validation {
    condition     = contains([20, 50, 100, 200, 500, 1000, 2000, 5000], var.network.bandwidth)
    error_message = "`bandwidth` 은 다음 설정에서만 가능 합니다. `20`,50`,`100`,`200`,`500`,`1000`,`2000`,`5000`."
  }

  validation {
    condition     = contains([1000000, 3000000, 10000000], var.network.concurrent)
    error_message = "`concurrent` 은 다음 설정에서만 가능 합니다. `1000000`,`3000000`,`10000000`."
  }
}

variable "primary_ip_assignment" {
  description = <<EOF
  (선택) NAT Gateway 에 기본 IP 주소 설정. `primary_ip_assignment` 블록 내용.
    (선택) `elastic_ip` - NAT Gateway 를 elastic IP 로 생성.
  EOF
  type = object({
    elastic_ip = optional(string)
  })
  default  = {}
  nullable = false
}

variable "tags" {
  description = "(선택) 리소스 태그 내용"
  type        = map(string)
  default     = {}
}
