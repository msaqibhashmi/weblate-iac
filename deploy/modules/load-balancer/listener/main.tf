resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = var.lb_arn
  port              = var.lb_listener_port
  protocol          = var.lb_listener_protocol
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn


  default_action {
    target_group_arn = var.lb_target_arn
    type             = "forward"
  }
}

