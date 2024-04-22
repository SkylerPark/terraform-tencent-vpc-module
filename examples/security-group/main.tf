locals {
  region = "ap-seoul"
}

module "security_group" {
  source = "../../modules/security-group"
  name   = "parksm-test-sg"

  ingress_rules = [
    {
      action     = "ACCEPT"
      port       = "80,443"
      protocol   = "TCP"
      ipv4_cidrs = ["192.168.0.0/16", "10.0.0.0/8", "172.168.0.0/24"]
    }
  ]

  egress_rules = [
    {
      action     = "ACCEPT"
      port       = "ALL"
      protocol   = "ALL"
      ipv4_cidrs = ["0.0.0.0/0"]
    }
  ]
}
