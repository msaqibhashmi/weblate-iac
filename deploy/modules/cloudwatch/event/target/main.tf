resource "aws_cloudwatch_event_target" "target" {
  rule = var.rule
  arn = var.lambda_arn
  target_id = var.target_type
}
