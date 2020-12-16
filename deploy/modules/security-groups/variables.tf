variable "vpc_id" {
  type = string
}

variable "security_group_name" {
  type = string
}

variable "create" {
  type = bool
}

variable "description" {
  type    = string
  default = "Firewall rules for trusted IPs only"
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

variable "rules" {
  type = list(object({
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
    cidr_blocks = list(string)
  }))
}
