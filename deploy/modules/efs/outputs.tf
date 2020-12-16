output "arn" {
  value       = join("", aws_efs_file_system.this.*.arn)
  description = "EFS ARN"
}

output "id" {
  value       = join("", aws_efs_file_system.this.*.id)
  description = "EFS ID"
}

output "mount_target_dns_names" {
  value       = coalescelist(aws_efs_mount_target.this.*.dns_name, [""])
  description = "List of EFS mount target DNS names"
}

output "mount_target_ids" {
  value       = coalescelist(aws_efs_mount_target.this.*.id, [""])
  description = "List of EFS mount target IDs (one per Availability Zone)"
}

output "mount_target_ips" {
  value       = coalescelist(aws_efs_mount_target.this.*.ip_address, [""])
  description = "List of EFS mount target IPs (one per Availability Zone)"
}

output "network_interface_ids" {
  value       = coalescelist(aws_efs_mount_target.this.*.network_interface_id, [""])
  description = "List of mount target network interface IDs"
}
