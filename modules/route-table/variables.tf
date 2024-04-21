variable "ipv4_routes" {
  description = <<EOF
  (선택) 라우팅 테이블 IPv4 리스트 `ipv4_routes` 블록 내용.
    (필수) `destination` - 목적지 IPv4 CIDR block.
    (필수) `target` - 라우팅 테이블 타겟 설정. `target` 블록 내용.
      (필수) `type` - 라우팅 테이블 타입. 다음과 같은 타입 만 지원 `NAT_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `CVM_INSTANCE`, `DIRECTCONNECT`, `VPC_PEERING_CONNECTION`, `HA_VIP`, `NORMAL_CVM_INSTANCE`, `ELASTIC_IP`.
      (필수) `id` - 타입에 대한 ID 값.
  EOF
  type = list(object({
    destination = string

    target = object({
      type = string
      id   = string
    })
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for route in var.ipv4_routes :
      contains(["NAT_GATEWAY", "VPN_GATEWAY", "LOCAL_GATEWAY", "CVM_INSTANCE", "DIRECTCONNECT", "VPC_PEERING_CONNECTION", "HA_VIP", "NORMAL_CVM_INSTANCE", "ELASTIC_IP"], route.target.type)
    ])
    error_message = "`type` 은 다음 설정에서만 가능 합니다. `NAT_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `CVM_INSTANCE`, `DIRECTCONNECT`, `VPC_PEERING_CONNECTION`, `HA_VIP`, `NORMAL_CVM_INSTANCE`, `ELASTIC_IP`."
  }
}

variable "ipv6_routes" {
  description = <<EOF
  (선택) 라우팅 테이블 IPv6 리스트 `ipv4_routes` 블록 내용.
    (필수) `destination` - 목적지 IPv6 CIDR block.
    (필수) `target` - 라우팅 테이블 타겟 설정. `target` 블록 내용.
      (필수) `type` - 라우팅 테이블 타입. 다음과 같은 타입 만 지원 `NAT_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `CVM_INSTANCE`, `DIRECTCONNECT`, `VPC_PEERING_CONNECTION`, `HA_VIP`, `NORMAL_CVM_INSTANCE`, `ELASTIC_IP`.
      (필수) `id` - 타입에 대한 ID 값.
  EOF
  type = list(object({
    destination = string

    target = object({
      type = string
      id   = string
    })
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for route in var.ipv4_routes :
      contains(["NAT_GATEWAY", "VPN_GATEWAY", "LOCAL_GATEWAY", "CVM_INSTANCE", "DIRECTCONNECT", "VPC_PEERING_CONNECTION", "HA_VIP", "NORMAL_CVM_INSTANCE", "ELASTIC_IP"], route.target.type)
    ])
    error_message = "`type` 은 다음 설정에서만 가능 합니다. `NAT_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `CVM_INSTANCE`, `DIRECTCONNECT`, `VPC_PEERING_CONNECTION`, `HA_VIP`, `NORMAL_CVM_INSTANCE`, `ELASTIC_IP`."
  }
}
