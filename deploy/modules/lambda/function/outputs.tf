output "arn" {
  description = "lambda function aws resource name a.k.a arn"
  value = aws_lambda_function.lambda.arn
}
output "name" {
  description = "lambda function name"
  value = aws_lambda_function.lambda.function_name
}
