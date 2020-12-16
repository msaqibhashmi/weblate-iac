resource "aws_lb" "this" {
  name               = var.name
  subnets            = var.subnet_ids
  internal           = var.internal
  load_balancer_type = var.elb_type
  security_groups    = [var.self_group_id, var.default_group_id, var.peering_group_id]

  enable_deletion_protection = var.delete_protection

  tags = {
    Name        = var.name
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
  }
}

