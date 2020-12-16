output "name" {
  description = "The name of the event rule"
  value       = aws_cloudwatch_event_rule.rule.name
}
output "arn" {
  description = "The ARN of the event rule"
  value       = aws_cloudwatch_event_rule.rule.arn
}
