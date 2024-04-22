output "id" {
  description = "NAT Gateway ID."
  value       = tencentcloud_nat_gateway.this.id
}

output "name" {
  description = "NAT Gateway 이름."
  value       = tencentcloud_nat_gateway.this.name
}

output "vpc_id" {
  description = "NAT Gateway 할당되어 있는 VPC ID."
  value       = tencentcloud_nat_gateway.this.vpc_id
}

output "availability_zone" {
  description = "NAT Gateway 존영역."
  value       = tencentcloud_nat_gateway.this.zone
}

output "subnet_id" {
  description = "NAT Gateway Subnet 정보."
  value       = tencentcloud_nat_gateway.this.subnet_id
}

output "elastic_ip" {
  description = "elastic Ip 주소의 할당 ID."
  value       = tencentcloud_nat_gateway.this.assigned_eip_set
}

output "network" {
  description = "NET Gateway Network 세팅 값."
  value = {
    bandwidth  = tencentcloud_nat_gateway.this.bandwidth
    concurrent = tencentcloud_nat_gateway.this.max_concurrent
  }
}
