output "vpc_id" {
  description = "subnet group 이 할당되어 있는 VPC ID."
  value       = values(tencentcloud_subnet.this)[0].vpc_id
}

output "ids" {
  description = "subnet group id list."
  value       = values(tencentcloud_subnet.this)[*].id
}

output "ipv4_cidrs" {
  description = "subnet IPv4 CIDR List."
  value       = compact(values(tencentcloud_subnet.this)[*].cidr_block)
}

output "ipv6_cidrs" {
  description = "subnet IPv6 CIDR List."
  value       = [for name, subnet in var.subnets : subnet.ipv6_cidr]
}

output "subnets" {
  description = "Subnet Group 정보 리스트."
  value       = local.subnets
}

output "subnets_by_az" {
  description = "subnet group 에 대한 availability zone."
  value = {
    for subnet in local.subnets :
    subnet.availability_zone => subnet...
  }
}
