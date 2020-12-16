resource "aws_eip" "elastic-ip" {
  instance = var.virtual_machine
  tags = {
    Name        = var.name
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
    Service     = var.service
  }
}
