locals {
  ipv6_enabled = length(var.ipv6_cidrs) > 0
}

###################################################
# VPC
###################################################
resource "tencentcloud_vpc" "this" {
  name       = var.name
  cidr_block = local.ipv6_enabled ? var.ipv6_cidrs[0].cidr : var.ipv4_cidrs[0].cidr

  dns_servers = length(var.dns_servers) > 0 ? var.dns_servers : null

  assistant_cidrs = local.ipv6_enabled ? length(var.ipv6_cidrs) - 1 > 0 ? [
    for index in length(var.ipv6_cidrs) - 1 : var.ipv6_cidrs[index].cidr
    ] : [] : length(var.ipv4_cidrs) - 1 > 0 ? [
    for index in length(var.ipv4_cidrs) - 1 : var.ipv4_cidrs[index].cidr
  ] : []

  is_multicast = var.is_multicast

  tags = var.tags
}

###################################################
# VPC IPv6
###################################################
resource "tencentcloud_vpc_ipv6_cidr_block" "this" {
  count  = local.ipv6_enabled ? 1 : 0
  vpc_id = tencentcloud_vpc.this.id
}
