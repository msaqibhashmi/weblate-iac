provider "aws" {
  region = "us-west-1"
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
resource "aws_elasticache_subnet_group" "cache" {
  name       = "weblate-prod-cache-subnet"
  subnet_ids = data.aws_subnet_ids.all.ids
}

# Modules
module "elasticache_cluster" {
  source = "../../../modules/elasticache/replication-group"

  default_security_group_id = data.aws_security_group.default.id

  cluster_name      = var.Name
  description       = "Golbal cache service to reduce computation load on databases"
  subnet_group_name = aws_elasticache_subnet_group.cache.name
  engine_version    = "5.0.6"
  node_type         = "cache.t3.small"
  nodes             = 2
  port              = 6379
  backup_days       = 5
  failover          = false

  application = var.Application
  environment = var.Environment
  team        = var.Team
  project     = var.Project
}
