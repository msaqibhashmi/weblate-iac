resource "aws_launch_template" "this" {
  name                    = var.name
  image_id                = var.image_id
  ebs_optimized           = true
  instance_type           = var.instance_type
  user_data               = base64encode(file("bootstrap.sh"))
  vpc_security_group_ids  = [var.security_group_id, var.default_security_group_id]
  disable_api_termination = var.disable_api_termination

  iam_instance_profile {
    name = var.instance_profile
  }

  block_device_mappings {
    device_name = "/dev/sda1"
    no_device   = true
    ebs {
      volume_size           = var.volume_size
      volume_type           = var.volume_type
      delete_on_termination = true
    }
  }

  monitoring {
    enabled = true
  }

  tags = {
    Name        = var.name
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = var.name
      Application = var.application
      Environment = var.environment
      Team        = var.team
      Project     = var.project
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      Name        = var.name
      Application = var.application
      Environment = var.environment
      Team        = var.team
      Project     = var.project
    }
  }
}

