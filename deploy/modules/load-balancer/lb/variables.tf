# Data sources
variable "subnet_ids" {
}

# Security Groups
#variable "self_group_id" {}
#variable "default_group_id" {}
#variable "peering_group_id" {}

# ELB Variables
variable "elb_type" {
}

variable "internal" {
  type = bool
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

