resource "aws_lb_target_group" "lb_target_group" {
  name     = var.name
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id

  tags = {
    Name        = var.name
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
  }

  health_check {
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    interval            = var.interval
    protocol            = var.protocol
    path                = var.path
  }

  stickiness {
    type            = var.stickiness_type
    cookie_duration = var.stickiness_cookie_duration
    enabled         = var.stickiness_enabled
  }
}
