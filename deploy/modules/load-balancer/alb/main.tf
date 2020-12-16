resource "aws_lb" "this" {
  name                             = var.name
  subnets                          = var.subnet_ids
  internal                         = var.internal
  load_balancer_type               = var.elb_type
  idle_timeout                     = var.timeout
  enable_deletion_protection       = var.delete_protection
  enable_cross_zone_load_balancing = var.cross_zone_load_balancing
  security_groups                  = var.security_groups

  tags = {
    Name        = var.name
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
  }
}
