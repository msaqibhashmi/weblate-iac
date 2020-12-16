variable "vpc_id" {
}

variable "security_group_name" {
}

variable "http_port" {
  default = null
}

variable "https_port" {
  default = null
}

variable "netdata_port" {
  default = null
}

variable "ssh_port" {
}

variable "trusted_ip" {
  type = list(string)
}

variable "all_ip" {
  type = list(string)
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

