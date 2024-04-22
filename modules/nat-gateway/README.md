# nat-gateway

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
| [tencentcloud_nat_gateway.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/nat_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (필수) NAT Gateway 리소스 이름. | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | (선택) NAT Gateway 의 Network 설정 `network` 블록 내용.<br>    (선택) `bandwidth` - NAT Gateway 의 Network Bandwidth 값 유효한값 `20`,50`,`100`,`200`,`500`,`1000`,`2000`,`5000` Defaults: 100<br>    (선택) `concurrent` - NAT Gateway 의 동시 연결 제한 유효한값 `1000000`,`3000000`,`10000000` Defaults: 1000000<br>` | <pre>object({<br>    bandwidth  = optional(number, 100)<br>    concurrent = optional(number, 1000000)<br>  })</pre> | `{}` | no |
| <a name="input_primary_ip_assignment"></a> [primary\_ip\_assignment](#input\_primary\_ip\_assignment) | (선택) NAT Gateway 에 기본 IP 주소 설정. `primary_ip_assignment` 블록 내용.<br>    (선택) `elastic_ip` - NAT Gateway 를 elastic IP 로 생성. | <pre>object({<br>    elastic_ip = optional(string)<br>  })</pre> | `{}` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | (필수) NAT Gateway 를 생성 할 Subnet ID. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용 | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | (필수) NAT Gateway 를 생성할 VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_availability_zone"></a> [availability\_zone](#output\_availability\_zone) | NAT Gateway 존영역. |
| <a name="output_elastic_ip"></a> [elastic\_ip](#output\_elastic\_ip) | elastic Ip 주소의 할당 ID. |
| <a name="output_id"></a> [id](#output\_id) | NAT Gateway ID. |
| <a name="output_name"></a> [name](#output\_name) | NAT Gateway 이름. |
| <a name="output_network"></a> [network](#output\_network) | NET Gateway Network 세팅 값. |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | NAT Gateway Subnet 정보. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | NAT Gateway 할당되어 있는 VPC ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
