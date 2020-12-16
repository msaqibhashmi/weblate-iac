resource "aws_lb_listener_rule" "listener_rule" {
  depends_on   = [var.alb_target_group]
  listener_arn = var.alb_listener.arn
  priority     = var.priority
  action {
    type             = "forward"
    target_group_arn = var.alb_target_group_id
  }
  condition {
    field  = "path-pattern"
    values = [var.alb_path]
  }
}

