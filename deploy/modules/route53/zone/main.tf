resource "aws_route53_zone" "this" {
  count   = length(var.zone_name)
  name    = element(var.zone_name, count.index)
  comment = var.comment
  vpc {
    vpc_id = var.vpc_id
  }
  lifecycle {
    ignore_changes = [vpc]
  }
  tags = {
    Application = var.Application
    Environment = var.Environment
    Team        = var.Team
    Project     = var.Project
  }
}
