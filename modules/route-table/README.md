# route-table

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > 0.13.0 |
| <a name="requirement_tencentcloud"></a> [tencentcloud](#requirement\_tencentcloud) | >1.18.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tencentcloud"></a> [tencentcloud](#provider\_tencentcloud) | >1.18.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tencentcloud_route_table.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/route_table) | resource |
| [tencentcloud_route_table_association.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/route_table_association) | resource |
| [tencentcloud_route_table_entry.ipv4](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/route_table_entry) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ipv4_routes"></a> [ipv4\_routes](#input\_ipv4\_routes) | (선택) 라우팅 테이블 IPv4 리스트 `ipv4_routes` 블록 내용.<br>    (필수) `destination` - 목적지 IPv4 CIDR block.<br>    (필수) `target` - 라우팅 테이블 타겟 설정. `target` 블록 내용.<br>      (필수) `type` - 라우팅 테이블 타입. 다음과 같은 타입 만 지원 `NAT_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `CVM_INSTANCE`, `DIRECTCONNECT`, `VPC_PEERING_CONNECTION`, `HA_VIP`, `NORMAL_CVM_INSTANCE`, `ELASTIC_IP`.<br>      (필수) `id` - 타입에 대한 ID 값. | <pre>list(object({<br>    destination = string<br><br>    target = object({<br>      type = string<br>      id   = string<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_ipv6_routes"></a> [ipv6\_routes](#input\_ipv6\_routes) | (선택) 라우팅 테이블 IPv6 리스트 `ipv4_routes` 블록 내용.<br>    (필수) `destination` - 목적지 IPv6 CIDR block.<br>    (필수) `target` - 라우팅 테이블 타겟 설정. `target` 블록 내용.<br>      (필수) `type` - 라우팅 테이블 타입. 다음과 같은 타입 만 지원 `NAT_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `CVM_INSTANCE`, `DIRECTCONNECT`, `VPC_PEERING_CONNECTION`, `HA_VIP`, `NORMAL_CVM_INSTANCE`, `ELASTIC_IP`.<br>      (필수) `id` - 타입에 대한 ID 값. | <pre>list(object({<br>    destination = string<br><br>    target = object({<br>      type = string<br>      id   = string<br>    })<br>  }))</pre> | `[]` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
