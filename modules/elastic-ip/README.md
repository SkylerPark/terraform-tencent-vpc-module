# elastic-ip

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
| [tencentcloud_eip.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/eip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_internet"></a> [internet](#input\_internet) | (선택) internet 영역에 설정값. `internet` 블록 내용.<br>    (선택) `charge_type` - 비용 청구에 대한 다음 설정값을 지원 `TRAFFIC_POSTPAID_BY_HOUR`,`BANDWIDTH_PACKAGE`,`BANDWIDTH_POSTPAID_BY_HOUR`,`BANDWIDTH_PREPAID_BY_MONTH` Default: TRAFFIC\_POSTPAID\_BY\_HOUR<br>    (선택) `bandwidth` - EIP 의 대역폭 제한 (Mbps) Default: 100. | <pre>object({<br>    charge_type = optional(string, "TRAFFIC_POSTPAID_BY_HOUR")<br>    bandwidth   = optional(number, 100)<br>  })</pre> | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | (필수) NAT Gateway 리소스 이름. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (선택) 리소스 태그 내용 | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | elastic ip ID |
| <a name="output_name"></a> [name](#output\_name) | elastic ip 이름 |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | elastic ip Ip address |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
