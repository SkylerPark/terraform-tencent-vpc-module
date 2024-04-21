resource "tencentcloud_eip" "this" {
  name = var.name

  tags = var.tags
}
