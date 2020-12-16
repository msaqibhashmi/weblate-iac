variable "image_id" {}
variable "instance_profile" { default = null }
variable "instance_type" {}
variable "volume_size" {}
variable "volume_type" {}
variable "disable_api_termination" {}

variable "security_group_id" {}
variable "default_security_group_id" {}
variable "peering_security_group_id" { default = null}

# Tags
variable "name" {}
variable "application" {}
variable "environment" {}
variable "team" {}
variable "project" {}
