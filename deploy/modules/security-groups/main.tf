resource "aws_security_group" "this" {
  count = var.create ? 1 : 0

  name                   = var.security_group_name
  description            = var.description
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = true

  tags = {
    Name        = var.name
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "this" {
  count = var.create ? length(var.rules) : 0

  security_group_id = concat(aws_security_group.this.*.id)[0]
  type              = var.rules[count.index]["type"]

  from_port   = var.rules[count.index]["from_port"]
  to_port     = var.rules[count.index]["to_port"]
  protocol    = var.rules[count.index]["protocol"]
  cidr_blocks = var.rules[count.index]["cidr_blocks"]
  description = var.rules[count.index]["description"]
}
