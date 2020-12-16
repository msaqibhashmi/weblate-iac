# IAM Role Jenkins Master
resource "aws_iam_policy" "policy" {
  name   = var.custom_policy_name
  policy = file(var.policy_file)
}

resource "aws_iam_role" "role" {
  name               = var.role_name
  assume_role_policy = file(var.assume_role_file)
  tags = {
    Application = var.Application
    Environment = var.Environment
    Team        = var.Team
    Project     = var.Project
  }
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_instance_profile" "profile" {
  name = aws_iam_role.role.name
  role = aws_iam_role.role.name
}

