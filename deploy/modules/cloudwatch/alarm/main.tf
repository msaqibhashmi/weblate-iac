resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name          = var.name
  alarm_description   = var.alarm_description
  namespace           = var.namespace
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  period              = var.period
  statistic           = var.statistics
  threshold           = var.threshold

  dimensions    = var.dimensions
  alarm_actions = var.alarm_actions

  tags = {
    Name        = var.name
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
  }
}
