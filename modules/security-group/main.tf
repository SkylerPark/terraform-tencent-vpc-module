###################################################
# Security Group
###################################################
resource "tencentcloud_security_group" "this" {
  name = var.name

  description = var.description
  project_id  = var.project_id

  tags = var.tags
}

###################################################
# Security Group Rules
###################################################
locals {
  normalized_ingress_rules = flatten([
    for rule in var.ingress_rules :
    concat(
      [
        for idx, cidr in rule.ipv4_cidrs :
        "${rule.action}#${cidr}#${rule.port}#${rule.protocol}"
      ],
      [
        for idx, cidr in rule.ipv6_cidrs :
        "${rule.action}#${cidr}#${rule.port}#${rule.protocol}"
      ],
      [
        for idx, security_group in rule.security_groups :
        "${rule.action}#${security_group}#${rule.port}#${rule.protocol}"
      ],
      [
        for self in [rule.self] :
        "${rule.action}#${tencentcloud_security_group.this.id}#${rule.port}#${rule.protocol}"
        if self
      ]
    )
  ])
  normalized_egress_rules = flatten([
    for rule in var.egress_rules :
    concat(
      [
        for idx, cidr in rule.ipv4_cidrs :
        "${rule.action}#${cidr}#${rule.port}#${rule.protocol}"
      ],
      [
        for idx, cidr in rule.ipv6_cidrs :
        "${rule.action}#${cidr}#${rule.port}#${rule.protocol}"
      ],
      [
        for idx, security_group in rule.security_groups :
        "${rule.action}#${security_group}#${rule.port}#${rule.protocol}"
      ],
      [
        for self in [rule.self] :
        "${rule.action}#${tencentcloud_security_group.this.id}#${rule.port}#${rule.protocol}"
        if self
      ]
    )
  ])
}

resource "tencentcloud_security_group_lite_rule" "this" {
  security_group_id = tencentcloud_security_group.this.id
  ingress           = local.normalized_ingress_rules
  egress            = local.normalized_egress_rules
}
