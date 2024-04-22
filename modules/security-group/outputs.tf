output "id" {
  description = "security group ID."
  value       = tencentcloud_security_group.this.id
}

output "name" {
  description = "security group 이름."
  value       = tencentcloud_security_group.this.name
}

output "description" {
  description = "security group 설명."
  value       = tencentcloud_security_group.this.description
}

output "project_id" {
  description = "security group 이 포함되어 있는 Project ID"
  value       = tencentcloud_security_group.this.project_id
}

output "ingress_rules" {
  description = "security group 수신 rules."
  value       = local.normalized_ingress_rules
}

output "egress_rules" {
  description = "security group 송신 rules."
  value       = local.normalized_egress_rules
}
