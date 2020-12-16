# Data sources
variable "ami_id" {
}

variable "subnet_id" {
}

# Instance & Volume
variable "instance_type" {
}

# Instance key
variable "key_name" {
  default = null
}

#Bootstrap_file
variable "bootstrap_file" { 
  default = "bootstrap.sh"
} 


variable "instance_profile" {
  default = null
}

variable "volume_size" {
}

variable "volume_type" {
}

# Firewall
variable "security_group_id" {
}

variable "default_security_group_id" {
}

variable "peering_security_group_id" {
  default = null
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

