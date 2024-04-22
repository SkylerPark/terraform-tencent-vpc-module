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
| [tencentcloud_route_table_entry.ipv6](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/route_table_entry) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ipv4_routes"></a> [ipv4\_routes](#input\_ipv4\_routes) | (선택) 라우팅 테이블 IPv4 리스트 `ipv4_routes` 블록 내용.<br>    (필수) `destination` - 목적지 IPv4 CIDR block.<br>    (필수) `target` - 라우팅 테이블 타겟 설정. `target` 블록 내용.<br>      (필수) `type` - 라우팅 테이블 타입. 다음과 같은 타입 만 지원 `NAT_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `CVM_INSTANCE`, `DIRECTCONNECT`, `VPC_PEERING_CONNECTION`, `HA_VIP`, `NORMAL_CVM_INSTANCE`, `ELASTIC_IP`.<br>      (필수) `id` - 타입에 대한 ID 값. | <pre>list(object({<br>    destination = string<br><br>    target = object({<br>      type = string<br>      id   = string<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_ipv6_routes"></a> [ipv6\_routes](#input\_ipv6\_routes) | (선택) 라우팅 테이블 IPv6 리스트 `ipv4_routes` 블록 내용.<br>    (필수) `destination` - 목적지 IPv6 CIDR block.<br>    (필수) `target` - 라우팅 테이블 타겟 설정. `target` 블록 내용.<br>      (필수) `type` - 라우팅 테이블 타입. 다음과 같은 타입 만 지원 `NAT_GATEWAY`, `VPN_GATEWAY`, `LOCAL_GATEWAY`, `CVM_INSTANCE`, `DIRECTCONNECT`, `VPC_PEERING_CONNECTION`, `HA_VIP`, `NORMAL_CVM_INSTANCE`, `ELASTIC_IP`.<br>      (필수) `id` - 타입에 대한 ID 값. | <pre>list(object({<br>    destination = string<br><br>    target = object({<br>      type = string<br>      id   = string<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) route table 이름. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | (선택) route table 에 적용할 Subnet ID 리스트. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용 | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | (필수) 서브넷을 생성할 VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | route table ID. |
| <a name="output_ipv4_routes"></a> [ipv4\_routes](#output\_ipv4\_routes) | IPv4 CIDR 라우팅 테이블 rule 리스트. |
| <a name="output_ipv6_routes"></a> [ipv6\_routes](#output\_ipv6\_routes) | IPv6 CIDR 라우팅 테이블 rule 리스트. |
| <a name="output_name"></a> [name](#output\_name) | route table Name. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | route table 할당되어 있는 VPC ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
