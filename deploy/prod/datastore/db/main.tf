provider "aws" {
  region = "us-west-1"
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
# Data Sources
data "aws_vpc" "selected" {
  default = true
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.selected.id
  filter {
    name   = "group-name"
    values = ["default"]
  }
}

#-------------------------------------------------------------
# Modules
#
# Firewall
module "firewall" {
  source              = "../../../modules/security-groups"
  create              = true
  vpc_id              = data.aws_vpc.selected.id
  security_group_name = var.Name
  rules               = local.rules

  name        = var.Name
  application = var.Application
  environment = var.Environment
  team        = var.Team
  project     = var.Project
}

# DB-Instance
module "db-instance" {
  source = "../../../modules/rds/db-instance"

  #db_subnet_group_name = "default-vpc-08b45f6e"

  vpc_security_group_ids = [
    data.aws_security_group.default.id,
    module.firewall.security_group_id
  ]

  identifier            = var.identifier
  engine                = "postgres"
  engine_version        = "10.7"
  instance_class        = "db.t2.small"
  allocated_storage     = "30"
  max_allocated_storage = "40"
  apply_immediately     = true
  publicly_accessible   = false
  storage_type          = "gp2"

  db_name  = var.db_name
  username = var.username
  password = var.password
  port     = 5432

  #snapshot_identifier      = var.snapshot_identifier
  copy_tags_to_snapshot     = true
  final_snapshot_identifier = var.final_snapshot_identifier
  skip_final_snapshot       = false

  performance_insights_enabled = var.performance_insights_enabled

  name        = var.Name
  application = var.Application
  environment = var.Environment
  team        = var.Team
  project     = var.Project
}
