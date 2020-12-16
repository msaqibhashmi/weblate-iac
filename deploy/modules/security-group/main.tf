resource "aws_security_group" "firewall" {
  vpc_id      = var.vpc_id
  name        = var.security_group_name
  description = "Firewall rules for trusted IPs only"

  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = var.trusted_ip
  }

  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = var.trusted_ip
  }

  ingress {
    from_port   = var.netdata_port
    to_port     = var.netdata_port
    protocol    = "tcp"
    cidr_blocks = var.trusted_ip
  }

  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = var.trusted_ip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "1"
    cidr_blocks = var.all_ip
  }
  tags = {
    Name        = var.name
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
  }
}
