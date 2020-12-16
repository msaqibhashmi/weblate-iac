# Required Variables for db_instances
variable identifier {
  type = string
}
variable engine {
  type = string
}
variable engine_version {
  type = string
}
variable instance_class {
  type = string
}
variable allocated_storage {
  type = string
}
variable port {
  type = string
}

# Database default Username and Password
variable username {
  type = string
}
variable password {
  type = string
}

# Tags
variable "name" {
  type = string
}
variable "application" {
  type = string
}
variable "environment" {
  type = string
}
variable "team" {
  type = string
}
variable "project" {
  type = string
}

# Optional Variables for db_instances
variable allow_major_version_upgrade {
  type    = bool
  default = false
}
variable apply_immediately {
  type    = bool
  default = false
}
variable auto_minor_version_upgrade {
  type    = bool
  default = true
}
variable availability_zone {
  type    = string
  default = ""
}
variable backup_retention_period {
  type    = number
  default = 1
}
variable backup_window {
  type    = string
  default = ""
}
variable ca_cert_identifier {
  type    = string
  default = "rds-ca-2019"
}
variable character_set_name {
  type    = string
  default = ""
}
variable copy_tags_to_snapshot {
  type    = bool
  default = false
}
variable db_subnet_group_name {
  type    = string
  default = ""
}
variable delete_automated_backups {
  type    = bool
  default = true
}
variable deletion_protection {
  type    = bool
  default = false
}
variable enabled_cloudwatch_logs_exports {
  type    = list(string)
  default = []
}
variable final_snapshot_identifier {
  type    = string
  default = "null"
}
variable iam_database_authentication_enabled {
  type    = bool
  default = false
}
variable iops {
  type    = number
  default = 0
}
variable kms_key_id {
  type    = string
  default = ""
}
variable license_model {
  type    = string
  default = ""
}
variable maintenance_window {
  type    = string
  default = ""
}
variable max_allocated_storage {
  type    = number
  default = 0
}
variable monitoring_interval {
  type    = number
  default = "0"
}
variable multi_az {
  type    = bool
  default = false
}
variable db_name {
  type    = string
  default = ""
}
variable parameter_group_name {
  type    = string
  default = ""
}
variable performance_insights_enabled {
  type    = bool
  default = false
}
variable performance_insights_retention_period {
  type    = number
  default = 7
}
variable publicly_accessible {
  type    = bool
  default = false
}
variable replicate_source_db {
  type    = string
  default = ""
}
variable skip_final_snapshot {
  type    = bool
  default = true
}
variable snapshot_identifier {
  type    = string
  default = ""
}
variable storage_encrypted {
  type    = bool
  default = false
}
variable storage_type {
  type    = string
  default = "gp2"
}
variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}

variable "timeouts" {
  type = map(string)
  default = {
    create = "40m"
    update = "80m"
    delete = "40m"
  }
}
