output "vpc_id" {
  description = "route table 할당되어 있는 VPC ID."
  value       = var.vpc_id
}

output "id" {
  description = "route table ID."
  value       = tencentcloud_route_table.this.id
}

output "name" {
  description = "route table Name."
  value       = tencentcloud_route_table.this.name
}

output "ipv4_routes" {
  description = "IPv4 CIDR 라우팅 테이블 rule 리스트."
  value = [
    for route in var.ipv4_routes : {
      destination = route.destination
      target = {
        id   = tencentcloud_route_table_entry.ipv4[route.destination].id,
        type = tencentcloud_route_table_entry.ipv4[route.destination].next_type
        id   = tencentcloud_route_table_entry.ipv4[route.destination].next_hub
      }
    }
  ]
}

output "ipv6_routes" {
  description = "IPv6 CIDR 라우팅 테이블 rule 리스트."
  value = [
    for route in var.ipv6_routes : {
      destination = route.destination
      target = {
        id   = tencentcloud_route_table_entry.ipv6[route.destination].id,
        type = tencentcloud_route_table_entry.ipv6[route.destination].next_type
        id   = tencentcloud_route_table_entry.ipv6[route.destination].next_hub
      }
    }
  ]
}
