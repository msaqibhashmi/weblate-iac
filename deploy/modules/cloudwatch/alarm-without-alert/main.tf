resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name          = var.name
  namespace           = "AWS/EC2"
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluaiton_period
  metric_name         = var.metric_name
  period              = var.period
  statistic           = var.statistics
  threshold           = var.threshold

  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  alarm_actions = [var.asg_policy_arn]

  tags = {
    Name        = var.name
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
  }
}
