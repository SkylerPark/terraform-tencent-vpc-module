# security-group

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
| [tencentcloud_security_group.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/security_group) | resource |
| [tencentcloud_security_group_lite_rule.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/security_group_lite_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | (선택) security group 설명. | `string` | `null` | no |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | (선택) 수신에 대한 설정 `egress_rules` 블록 내용.<br>    (필수) `action` - 수신 규칙 정책. `ACCEPT`, `DROP` 둘중 하나만 설정 가능.<br>    (필수) `protocol` - 규칙에 대한 protocol. `protocol` 이 `ALL` 로 됫을댄 모든 프로토콜로 정의 됩니다 `ALL`,`TCP`,`UDP`,`ICMP`.<br>    (필수) `port` - 포트 범위를 나타냅니다 `80`, `80-90`, `80,443` 과 같이 설정 가능.<br>    (선택) `ipv4_cidrs` - IPv4 에 대한 CIDR 리스트.<br>    (선택) `ipv6_cidrs` - IPv6에 대한 CIDR 리스트.<br>    (선택) `security_groups` - Security Group ID 리스트.<br>    (선택) `self` - self 보안그룹을 추가할 것인지 여부. | <pre>list(object({<br>    action          = string<br>    protocol        = string<br>    port            = string<br>    ipv4_cidrs      = optional(list(string), [])<br>    ipv6_cidrs      = optional(list(string), [])<br>    prefix_lists    = optional(list(string), [])<br>    security_groups = optional(list(string), [])<br>    self            = optional(bool, false)<br>  }))</pre> | `[]` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | (선택) 수신에 대한 설정 `ingress_rules` 블록 내용.<br>    (필수) `action` - 수신 규칙 정책. `ACCEPT`, `DROP` 둘중 하나만 설정 가능.<br>    (필수) `protocol` - 규칙에 대한 protocol. `protocol` 이 `ALL` 로 됫을댄 모든 프로토콜로 정의 됩니다 `ALL`,`TCP`,`UDP`,`ICMP`.<br>    (필수) `port` - 포트 범위를 나타냅니다 `80`, `80-90`, `80,443` 과 같이 설정 가능.<br>    (선택) `ipv4_cidrs` - IPv4 에 대한 CIDR 리스트.<br>    (선택) `ipv6_cidrs` - IPv6에 대한 CIDR 리스트.<br>    (선택) `security_groups` - Security Group ID 리스트.<br>    (선택) `self` - self 보안그룹을 추가할 것인지 여부. | <pre>list(object({<br>    action          = string<br>    protocol        = string<br>    port            = string<br>    ipv4_cidrs      = optional(list(string), [])<br>    ipv6_cidrs      = optional(list(string), [])<br>    prefix_lists    = optional(list(string), [])<br>    security_groups = optional(list(string), [])<br>    self            = optional(bool, false)<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) security group 이름. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | (필수) security group 이 적용될 Project ID. Default: 0 | `number` | `0` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용 | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_description"></a> [description](#output\_description) | security group 설명. |
| <a name="output_egress_rules"></a> [egress\_rules](#output\_egress\_rules) | security group 송신 rules. |
| <a name="output_id"></a> [id](#output\_id) | security group ID. |
| <a name="output_ingress_rules"></a> [ingress\_rules](#output\_ingress\_rules) | security group 수신 rules. |
| <a name="output_name"></a> [name](#output\_name) | security group 이름. |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | security group 이 포함되어 있는 Project ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
