resource "aws_efs_file_system" "this" {
  count = var.create ? 1 : 0

  creation_token                  = var.creation_token
  encrypted                       = var.encrypted
  kms_key_id                      = var.kms_key_id
  performance_mode                = var.performance_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps
  throughput_mode                 = var.throughput_mode

  dynamic "lifecycle_policy" {
    for_each = var.transition_to_ia == "" ? [] : [1]
    content {
      transition_to_ia = var.transition_to_ia
    }
  }

  tags = {
    Name        = var.name
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
    App_Version = var.app_version
  }
}

resource "aws_efs_mount_target" "this" {
  count           = var.create && length(var.subnet_ids) > 0 ? length(var.subnet_ids) : 0
  file_system_id  = join("", aws_efs_file_system.this.*.id)
  ip_address      = var.mount_target_ip_address
  subnet_id       = var.subnet_ids[count.index]
  security_groups = var.security_groups
}
