# IAM Role
data "aws_iam_policy" "find" {
  arn = "arn:aws:iam::aws:policy/${var.aws_policy_name}"
}

resource "aws_iam_role" "role" {
  name = var.role_name
  assume_role_policy = file(var.assume_role_file)
  tags = {
    Application = var.Application
    Environment = var.Environment
    Team        = var.Team
    Project     = var.Project
  }
}

resource "aws_iam_instance_profile" "profile" {
  name = aws_iam_role.role.name
  role = aws_iam_role.role.name
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.role.name
  policy_arn = data.aws_iam_policy.find.arn
}

