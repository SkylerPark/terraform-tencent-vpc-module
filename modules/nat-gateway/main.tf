###################################################
# NAT Gateway
###################################################
resource "tencentcloud_nat_gateway" "this" {
  name      = var.name
  vpc_id    = var.vpc_id
  subnet_id = var.subnet_id

  bandwidth        = var.network.bandwidth
  max_concurrent   = var.network.concurrent
  assigned_eip_set = [var.primary_ip_assignment.elastic_ip]

  tags = var.tags
}
