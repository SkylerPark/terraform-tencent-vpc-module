locals {
  route_next_type = {
    "NAT_GATEWAY"            = "NAT"
    "VPN_GATEWAY"            = "VPN"
    "LOCAL_GATEWAY"          = "LOCAL_GATEWAY"
    "CVM_INSTANCE"           = "CVM"
    "DIRECTCONNECT"          = "DIRECTCONNECT"
    "VPC_PEERING_CONNECTION" = "PEERCONNECTION"
    "HA_VIP"                 = "HAVIP"
    "NORMAL_CVM_INSTANCE"    = "NORMAL_CVM"
    "ELASTIC_IP"             = "EIP"
  }
}

###################################################
# Route Table
###################################################
resource "tencentcloud_route_table" "this" {
  vpc_id = var.vpc_id
  name   = var.name

  tags = var.tags
}

###################################################
# Associations
###################################################
resource "tencentcloud_route_table_association" "this" {
  for_each       = { for idx, subnet_id in var.subnets : idx => subnet_id }
  route_table_id = tencentcloud_route_table.this.id
  subnet_id      = each.value
}

###################################################
# IPv4 Routes
###################################################
resource "tencentcloud_route_table_entry" "ipv4" {
  for_each = {
    for route in var.ipv4_routes :
    route.destination => route
  }

  route_table_id         = tencentcloud_route_table.this.id
  destination_cidr_block = each.key

  next_hub  = each.value.target.id
  next_type = local.route_next_type[each.value.target.type]
}

###################################################
# IPv6 Routes
###################################################
resource "tencentcloud_route_table_entry" "ipv6" {
  for_each = {
    for route in var.ipv6_routes :
    route.destination => route
  }

  route_table_id         = tencentcloud_route_table.this.id
  destination_cidr_block = each.key

  next_hub  = each.value.target.id
  next_type = local.route_next_type[each.value.target.type]
}
