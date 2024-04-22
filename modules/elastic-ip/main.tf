resource "tencentcloud_eip" "this" {
  name = var.name

  internet_charge_type       = var.internet.charge_type
  internet_max_bandwidth_out = var.internet.bandwidth

  tags = var.tags
}
