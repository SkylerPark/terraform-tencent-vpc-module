# vpc

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
| [tencentcloud_vpc.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/vpc) | resource |
| [tencentcloud_vpc_ipv6_cidr_block.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/vpc_ipv6_cidr_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | (선택) VPC 의 DNS 목록. 목록에는 0~5개의 서버를 지정가능. | `list(string)` | `[]` | no |
| <a name="input_ipv4_cidrs"></a> [ipv4\_cidrs](#input\_ipv4\_cidrs) | (필수) IPv4 CIDR 리스트.<br>      (선택) `cidr` - VPC CIDR block between /16 and /28 | <pre>list(object({<br>    cidr = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_ipv6_cidrs"></a> [ipv6\_cidrs](#input\_ipv6\_cidrs) | (필수) IPv4 CIDR 리스트.<br>      (선택) `cidr` - VPC CIDR block between /16 and /28 | <pre>list(object({<br>    cidr = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_is_multicast"></a> [is\_multicast](#input\_is\_multicast) | VPC 멀티캐스트 활성화 여부. Default: false | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) VPC 이름 | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용 | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | VPC ID |
| <a name="output_ipv4_primary_cidr"></a> [ipv4\_primary\_cidr](#output\_ipv4\_primary\_cidr) | VPC Primary CIDR Blocks. |
| <a name="output_ipv4_secondary_cidr"></a> [ipv4\_secondary\_cidr](#output\_ipv4\_secondary\_cidr) | VPC Secondary CIDR Blocks |
| <a name="output_ipv6_primary_cidr"></a> [ipv6\_primary\_cidr](#output\_ipv6\_primary\_cidr) | VPC Primary CIDR blocks. |
| <a name="output_ipv6_secondary_cidr"></a> [ipv6\_secondary\_cidr](#output\_ipv6\_secondary\_cidr) | VPC Primary CIDR blocks. |
| <a name="output_is_multicast"></a> [is\_multicast](#output\_is\_multicast) | VPC multicast 여부 |
| <a name="output_name"></a> [name](#output\_name) | VPC 이름 |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
