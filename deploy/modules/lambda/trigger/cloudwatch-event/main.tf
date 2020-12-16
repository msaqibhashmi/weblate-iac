resource "aws_lambda_permission" "allow_cloudwatch" {
  function_name = var.function_name
  source_arn    = var.source_arn
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  principal     = "events.amazonaws.com"
}
