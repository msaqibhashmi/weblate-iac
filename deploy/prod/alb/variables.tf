variable "public_alb_name" {
  default = "weblate-prod-alb-v1"
}

variable "delete_protection" {
  default = "true"
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

# Firewall
variable "ingress_rules" {
  default = [
    {
      type        = "ingress"
      from_port   = 80
      to_port     = 80
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

