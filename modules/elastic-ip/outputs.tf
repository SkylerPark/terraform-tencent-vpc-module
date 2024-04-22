output "name" {
  description = "elastic ip 이름"
  value       = tencentcloud_eip.this.name
}

output "public_ip" {
  description = "elastic ip Ip address"
  value       = tencentcloud_eip.this.public_ip
}

output "id" {
  description = "elastic ip ID"
  value       = tencentcloud_eip.this.id
}
