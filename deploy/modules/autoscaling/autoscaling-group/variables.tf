# ELB Attachment
variable "target_group_arn" {
  type = list(string)
}

# Instance config
variable "launch_configuration" { default = null }
variable "launch_template" { default = null }

# Subnet Ids
variable "subnet_ids" {
  type = list(string)
}

# health Check
variable "health_check_type" {
}

variable "health_check_grace_period" {
}

# Sizing
variable "min_size" {
}

variable "max_size" {
}

# Tags
variable "name" {
}

variable "application" {
}

variable "environment" {
}

variable "team" {
}

variable "project" {
}

