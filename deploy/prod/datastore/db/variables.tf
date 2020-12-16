variable "identifier" {
  default = "postgresql-prod-db-v1"
}

variable "final_snapshot_identifier" {
  default = "postgresql-prod-db-v1"
}

variable "snapshot_identifier" {
  default = "postgresql-prod-db-v0"
}

variable username {
  default = "weblate"
}

variable password {
  default = "ChangeMe"
}

variable db_name {
  default = "weblate"
}

variable "Name" {
  default = "postgresql-prod-db-v1"
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

variable "performance_insights_enabled" {
  default = true
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
      from_port   = 5432
      to_port     = 5432
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
