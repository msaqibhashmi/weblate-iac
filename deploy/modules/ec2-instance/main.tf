resource "aws_instance" "virtual-machine" {
  ami                  = var.ami_id
  subnet_id            = var.subnet_id
  security_groups      = [var.security_group_id, var.default_security_group_id]
  instance_type        = var.instance_type
  iam_instance_profile = var.instance_profile
  key_name             = var.key_name
  user_data            = file(var.bootstrap_file)
  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = true
  }
  volume_tags = {
    Name        = var.name
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
  }
  tags = {
    Name        = var.name
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
  }
}

