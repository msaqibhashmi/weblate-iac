resource "aws_db_subnet_group" "db_subnet_group" {
  name        = var.subnet_name
  subnet_ids  = var.subnet_ids
  description = var.description

  tags = {
    Name        = var.name
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
  }
}
