# subnet-group

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
| [tencentcloud_subnet.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/subnet) | resource |
| [tencentcloud_vpc_ipv6_subnet_cidr_block.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/vpc_ipv6_subnet_cidr_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_is_multicast"></a> [is\_multicast](#input\_is\_multicast) | Subnet 멀티캐스트 활성화 여부. Default: false | `bool` | `false` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | (필수) 서브넷 그룹. Each block of `subnets` 블록 내용.<br>    (선택) `type` - Subnet 타입을 지정 가능한 설정값 `DUALSTACK` or `IPV6`. Default: `DUALSTACK`.<br>    (선택) `availability_zone` - Subnet 에 대한 가용영역.<br>    (선택) `ipv4_cidr` - subnet IPV4 CIDR.<br>    (선택) `ipv6_cidr` - subnet IPV6 CIDR. | <pre>map(object({<br>    type = optional(string, "IPV4")<br><br>    availability_zone = optional(string)<br>    ipv4_cidr         = optional(string)<br>    ipv6_cidr         = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용 | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | (필수) 서브넷을 생성할 VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | subnet group id list. |
| <a name="output_ipv4_cidrs"></a> [ipv4\_cidrs](#output\_ipv4\_cidrs) | subnet IPv4 CIDR List. |
| <a name="output_ipv6_cidrs"></a> [ipv6\_cidrs](#output\_ipv6\_cidrs) | subnet IPv6 CIDR List. |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | Subnet Group 정보 리스트. |
| <a name="output_subnets_by_az"></a> [subnets\_by\_az](#output\_subnets\_by\_az) | subnet group 에 대한 availability zone. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | subnet group 이 할당되어 있는 VPC ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
