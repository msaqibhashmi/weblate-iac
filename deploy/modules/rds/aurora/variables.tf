# Required Variables
variable name {
  type = string
}
variable application {
  type = string
}
variable environment {
  type = string
}
variable team {
  type = string
}
variable project {
  type = string
}

# Aurora Cluster Required Variables
variable cluster_identifier {
  type = string
}
variable master_password {
  type = string
}
variable master_username {
  type = string
}

# Aurora Cluster Optional Variables
variable apply_immediately {
  type    = bool
  default = "false"
}
variable availability_zones {
  type    = list(string)
  default = []
}
variable backtrack_window {
  type    = number
  default = 0
}
variable backup_retention_period {
  type    = number
  default = 0
}
variable copy_tags_to_snapshot {
  type    = bool
  default = false
}
variable database_name {
  type    = string
  default = ""
}
variable db_cluster_parameter_group_name {
  type    = string
  default = null
}
variable db_subnet_group_name {
  type    = string
  default = ""
}
variable deletion_protection {
  type    = bool
  default = false
}
variable enable_http_endpoint {
  type    = bool
  default = false
}
variable enabled_cloudwatch_logs_exports {
  type    = list(string)
  default = []
}
variable engine_mode {
  type    = string
  default = "provisioned"
}
variable engine_version {
  type    = string
  default = "5.6.10a"
}
variable engine {
  type    = string
  default = "aurora"
}
variable final_snapshot_identifier {
  type    = string
  default = ""
}
variable global_cluster_identifier {
  type    = string
  default = ""
}
variable iam_database_authentication_enabled {
  type    = bool
  default = false
}
variable iam_roles {
  type    = list(string)
  default = []
}
variable kms_key_id {
  type    = string
  default = ""
}
variable port {
  type    = string
  default = "3306"
}
variable preferred_backup_window {
  type    = string
  default = ""
}
variable preferred_maintenance_window {
  type    = string
  default = ""
}
variable replication_source_identifier {
  type    = string
  default = ""
}
variable scaling_configuration {
  type    = map(string)
  default = {}
}
variable skip_final_snapshot {
  type    = bool
  default = true
}
variable snapshot_identifier {
  type    = string
  default = ""
}
variable source_region {
  type    = string
  default = ""
}
variable storage_encrypted {
  type    = bool
  default = true
}
variable vpc_security_group_ids {
  type    = list(string)
  default = []
}

# Aurora Cluster DB instance Required Parameters
variable instance_type {
  type = string
}
variable db_identifier {
  type = string
}

# Aurora Cluster DB instance Optional Parameters
variable replica_scale_enabled {
  type    = bool
  default = false
}
variable replica_scale_max {
  type    = number
  default = 0
}
variable replica_scale_min {
  type    = number
  default = 2
}
variable replica_count {
  type    = number
  default = 1
}
variable predefined_metric_type {
  type    = string
  default = "RDSReaderAverageCPUUtilization"
}
variable replica_scale_in_cooldown {
  type    = number
  default = 300
}
variable replica_scale_out_cooldown {
  type    = number
  default = 300
}
variable replica_scale_cpu {
  type    = number
  default = 70
}
variable replica_scale_connections {
  type    = number
  default = 700
}
variable publicly_accessible {
  type    = bool
  default = false
}
variable db_parameter_group_name {
  type    = string
  default = null
}
variable monitoring_interval {
  type    = number
  default = 0
}
variable auto_minor_version_upgrade {
  type    = bool
  default = true
}
variable performance_insights_enabled {
  type    = bool
  default = false
}
variable performance_insights_kms_key_id {
  type    = string
  default = ""
}
variable ca_cert_identifier {
  type    = string
  default = "rds-ca-2019"
}
variable monitoring_role_arn {
  type    = string
  default = ""
}
