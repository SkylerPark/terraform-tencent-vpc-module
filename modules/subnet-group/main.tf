###################################################
# Subnets
###################################################
resource "tencentcloud_subnet" "this" {
  for_each = var.subnets

  vpc_id            = var.vpc_id
  name              = each.key
  cidr_block        = each.value.ipv4_cidr
  availability_zone = each.value.availability_zone
  is_multicast      = var.is_multicast

  tags = var.tags
}

###################################################
# Subnets IPv6
###################################################
resource "tencentcloud_vpc_ipv6_subnet_cidr_block" "this" {
  for_each = { for name, subnet in var.subnets : name => subnet if subnet.type == "IPV6" }

  vpc_id = var.vpc_id

  dynamic "ipv6_subnet_cidr_blocks" {
    for_each = [subnet.ipv6_cidr]
    iterator = ipv6_cidr

    content {
      subnet_id       = tencentcloud_subnet.this[each.key].id
      ipv6_cidr_block = ipv6_cidr
    }
  }
}
