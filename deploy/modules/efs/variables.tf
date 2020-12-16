variable "create" {
  type    = bool
  default = false
}

variable "creation_token" {
  type    = string
  default = ""
}

variable "encrypted" {
  type    = bool
  default = false
}

variable "kms_key_id" {
  type    = string
  default = null
}

variable "performance_mode" {
  type    = string
  default = "generalPurpose"
}

variable "provisioned_throughput_in_mibps" {
  type    = number
  default = 0
}

variable "throughput_mode" {
  type    = string
  default = "bursting"
}

variable "transition_to_ia" {
  type    = string
  default = ""
}

variable "subnet_ids" {
  type    = list(string)
  default = []
}

variable "security_groups" {
  type    = list(string)
  default = []
}

variable "mount_target_ip_address" {
  type    = string
  default = null
}

# Tags
variable "name" {
  type    = string
  default = null
}

variable "application" {
  type    = string
  default = null
}

variable "environment" {
  type    = string
  default = null
}

variable "team" {
  type    = string
  default = null
}

variable "project" {
  type    = string
  default = null
}

variable "app_version" {
  type    = string
  default = null
}
