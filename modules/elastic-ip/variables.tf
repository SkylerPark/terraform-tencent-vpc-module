variable "name" {
  description = "(필수) NAT Gateway 리소스 이름."
  type        = string
  nullable    = false
}

variable "internet" {
  description = <<EOF
  (선택) internet 영역에 설정값. `internet` 블록 내용.
    (선택) `charge_type` - 비용 청구에 대한 다음 설정값을 지원 `TRAFFIC_POSTPAID_BY_HOUR`,`BANDWIDTH_PACKAGE`,`BANDWIDTH_POSTPAID_BY_HOUR`,`BANDWIDTH_PREPAID_BY_MONTH` Default: TRAFFIC_POSTPAID_BY_HOUR
    (선택) `bandwidth` - EIP 의 대역폭 제한 (Mbps) Default: 100.
  EOF
  type = object({
    charge_type = optional(string, "TRAFFIC_POSTPAID_BY_HOUR")
    bandwidth   = optional(number, 100)
  })
  default  = {}
  nullable = false

  validation {
    condition     = contains(["TRAFFIC_POSTPAID_BY_HOUR", "BANDWIDTH_PACKAGE", "BANDWIDTH_POSTPAID_BY_HOUR", "BANDWIDTH_PREPAID_BY_MONTH"], var.internet.charge_type)
    error_message = "`charge_type` 은 다음 설정에서만 가능 합니다. `TRAFFIC_POSTPAID_BY_HOUR`,`BANDWIDTH_PACKAGE`,`BANDWIDTH_POSTPAID_BY_HOUR`,`BANDWIDTH_PREPAID_BY_MONTH`."
  }
}

variable "tags" {
  description = "(선택) 리소스 태그 내용"
  type        = map(string)
  default     = {}
}
