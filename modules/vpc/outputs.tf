output "name" {
  description = "VPC 이름"
  value       = tencentcloud_vpc.this.name
}

output "id" {
  description = "VPC ID"
  value       = tencentcloud_vpc.this.id
}

output "is_multicast" {
  description = "VPC multicast 여부"
  value       = tencentcloud_vpc.this.is_multicast
}

output "ipv4_primary_cidr" {
  description = "VPC Primary CIDR Blocks."
  value       = tencentcloud_vpc.this.cidr_block
}

output "ipv4_secondary_cidr" {
  description = "VPC Secondary CIDR Blocks"
  value       = tencentcloud_vpc.this.docker_assistant_cidrs
}

output "ipv6_primary_cidr" {
  description = "VPC Primary CIDR blocks."
  value       = local.ipv6_enabled ? tencentcloud_vpc_ipv6_cidr_block.this[0].ipv6_cidr_block : null
}

output "ipv6_secondary_cidr" {
  description = "VPC Primary CIDR blocks."
  value       = local.ipv6_enabled ? tencentcloud_vpc.this.docker_assistant_cidrs : []
}
