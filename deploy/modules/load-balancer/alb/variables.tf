# Data sources
variable "subnet_ids" {
}

# Security Groups
variable "security_groups" {
  type = list(string)
}

# ELB Variables
variable "elb_type" {
}

variable "internal" {
  type = bool
}

variable "timeout" {
  default = null
}

variable "cross_zone_load_balancing" {
}

variable "delete_protection" {
  type = bool
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
