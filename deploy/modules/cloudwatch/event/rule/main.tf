resource "aws_cloudwatch_event_rule" "rule" {
  name = var.name
  description = var.description
  schedule_expression = var.cron_expression

  tags = {
    Name        = var.name
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
  }
}
