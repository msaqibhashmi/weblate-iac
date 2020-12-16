variable "source_ami_name" {
  default = "weblate-*"
}

variable "source_ami_owner" {
  default = "self"
}

variable "delete_protection" {
  default = "true"
}

variable "Name" {
  default = "weblate-prod-web-v1"
}

variable "alarm_high_cpu_name" {
  default = "weblate-prod-web-v1"
}

variable "alarm_low_cpu_name" {
  default = "weblate-prod-web-v1-low-cpu"
}

variable "Application" {
  default = "Weblate"
}

variable "Environment" {
  default = "Production"
}

variable "Team" {
  default = "Backend"
}

variable "Project" {
  default = "Demo"
}

variable "cidr_blocks" {
  default = [
    "110.93.203.98/32",
    "110.93.203.99/32",
    "110.93.203.100/32",
    "172.111.188.188/32",
    "192.142.211.178/32"
  ]
}

variable "ingress_rules" {
  default = [
    {
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Trusted IPs"
    },
    {
      type        = "ingress"
      from_port   = 10786
      to_port     = 10786
      protocol    = "tcp"
      description = "Trusted IPs"
    }
  ]
}

variable "egress_rules" {
  default = [
    {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "1"
      description = "Outbound Ips"
      cidr_blocks = [
        "0.0.0.0/0"
      ]
    }
  ]
}
