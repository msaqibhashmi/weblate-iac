provider "aws" {
  version = "~> 2.40"
  region  = "us-west-1"
}

#-------------------------------------------------------------
# Data Sources
data "aws_vpc" "selected" {
  default = true
}
data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.selected.id
}
data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.selected.id
  filter {
    name   = "group-name"
    values = ["default"]
  }
}

#-------------------------------------------------------------
# Local Variables
locals {
  rules = concat(
    [
      for ruleList in var.ingress_rules :
      {
        type        = ruleList.type
        from_port   = ruleList.from_port
        to_port     = ruleList.to_port
        protocol    = ruleList.protocol
        description = ruleList.description
        cidr_blocks = flatten(concat(var.cidr_blocks, [data.aws_vpc.selected.cidr_block]))
      }
    ],
    var.egress_rules
  )
}

#-------------------------------------------------------------
# Firewall
module "firewall" {
  source              = "../../modules/security-groups"
  create              = true
  vpc_id              = data.aws_vpc.selected.id
  security_group_name = var.public_alb_name
  rules               = local.rules

  name        = var.public_alb_name
  application = var.Application
  environment = var.Environment
  team        = var.Team
  project     = var.Project
}

module "alb" {
  source     = "../../modules/load-balancer/alb"
  subnet_ids = data.aws_subnet_ids.all.ids

  security_groups = [
    data.aws_security_group.default.id,
    module.firewall.security_group_id
  ]

  delete_protection         = var.delete_protection
  internal                  = "false"
  elb_type                  = "application"
  cross_zone_load_balancing = "true"
  timeout                   = 150

  name        = var.public_alb_name
  application = var.Application
  environment = var.Environment
  team        = var.Team
  project     = var.Project
}
