resource "aws_lambda_function" "lambda" {
  filename         = var.filename
  function_name    = var.function_name
  role             = var.role
  handler          = var.handler
  runtime          = var.runtime
  source_code_hash = filebase64sha256(var.filename)
  timeout          = "60"

  environment {
    variables = {
      NAME = var.function_name
      ACCESS_KEY_ID     = var.access_key_id
      ACCESS_KEY_SECRET = var.access_key_secret
    }
  }

  tags = {
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
  }
}
