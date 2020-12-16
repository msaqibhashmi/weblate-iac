resource "aws_launch_configuration" "as_conf" {
  name            = var.name
  image_id        = var.ami_id
  instance_type   = var.instance_type
  user_data       = file("bootstrap.sh")
  security_groups = [var.security_group_id, var.default_security_group_id, var.peering_security_group_id]
  ebs_optimized   = true

  lifecycle {
    create_before_destroy = true
  }

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = true
  }
}

