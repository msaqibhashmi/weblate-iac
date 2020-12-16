resource "aws_autoscaling_group" "this" {

  name                 = var.name
  launch_configuration = var.launch_configuration
  launch_template {
    id      = var.launch_template
    version = "$Latest"
  }

  vpc_zone_identifier       = var.subnet_ids
  target_group_arns         = var.target_group_arn
  health_check_type         = var.health_check_type
  health_check_grace_period = var.health_check_grace_period
  termination_policies      = ["NewestInstance", "OldestLaunchTemplate", "OldestLaunchConfiguration", "Default"]

  force_delete    = true
  min_size        = var.min_size
  max_size        = var.max_size
  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]

  tags = [
    {
      key                 = "Name"
      value               = var.name
      propagate_at_launch = false
    },
    {
      key                 = "Application"
      value               = var.application
      propagate_at_launch = false
    },
    {
      key                 = "Environment"
      value               = var.environment
      propagate_at_launch = false
    },
    {
      key                 = "Team"
      value               = var.team
      propagate_at_launch = false
    },
    {
      key                 = "Project"
      value               = var.project
      propagate_at_launch = false
    },
  ]
}

