provider "aws" {
  version = "~> 2.40"
  region  = "us-west-1"
}

#-------------------------------------------------------------
# Local Variables
locals {
  rules = concat(
    [
      for ruleList in var.ingress_rules :
      {
        type        = ruleList.type
        from_port   = ruleList.from_port
        to_port     = ruleList.to_port
        protocol    = ruleList.protocol
        description = ruleList.description
        cidr_blocks = flatten(concat(var.cidr_blocks, [data.aws_vpc.selected.cidr_block]))
      }
    ],
    var.egress_rules
  )
}

#-------------------------------------------------------------
# Data Sources
data "aws_ami" "machine-image" {
  most_recent = true
  owners      = [var.source_ami_owner]
  filter {
    name   = "name"
    values = [var.source_ami_name]
  }
}
data "aws_vpc" "selected" {
  default = true
}
data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.selected.id
}
data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.selected.id
  filter {
    name   = "group-name"
    values = ["default"]
  }
}

#-------------------------------------------------------------
# Modules
#
# Firewall
module "firewall" {
  source              = "../../modules/security-groups"
  create              = true
  vpc_id              = data.aws_vpc.selected.id
  security_group_name = var.Name
  rules               = local.rules

  name        = var.Name
  application = var.Application
  environment = var.Environment
  team        = var.Team
  project     = var.Project
}

module "target_group" {
  source              = "../../modules/load-balancer/target-group"
  vpc_id              = data.aws_vpc.selected.id
  protocol            = "HTTP"
  port                = "80"
  path                = "/custom-healthcheck"
  healthy_threshold   = 3
  unhealthy_threshold = 3
  interval            = 30

  name        = var.Name
  application = var.Application
  environment = var.Environment
  team        = var.Team
  project     = var.Project
}

# Auto Scaling Group
module "launch_template" {
  source                    = "../../modules/launch-templates"
  image_id                  = data.aws_ami.machine-image.id
  default_security_group_id = data.aws_security_group.default.id
  security_group_id         = module.firewall.security_group_id
  instance_type             = "t3.small"
  volume_size               = "20"
  volume_type               = "gp2"
  disable_api_termination   = var.delete_protection

  name        = var.Name
  application = var.Application
  environment = var.Environment
  team        = var.Team
  project     = var.Project
}

module "autoscaling_group" {
  source                    = "../../modules/autoscaling/autoscaling-group"
  subnet_ids                = data.aws_subnet_ids.all.ids
  target_group_arn          = [module.target_group.target_arn]
  launch_template           = module.launch_template.launch_temp_id
  health_check_type         = "EC2"
  health_check_grace_period = "30"
  min_size                  = "2"
  max_size                  = "3"

  name        = var.Name
  application = var.Application
  environment = var.Environment
  team        = var.Team
  project     = var.Project
}

module "asg_scaling_policy_high_cpu" {
  source             = "../../modules/autoscaling/scaling-policy"
  asg_name           = module.autoscaling_group.asg_name
  name               = "HighCpu"
  adjustment_type    = "ChangeInCapacity"
  scaling_adjustment = 1
  cooldown           = 300
}

module "asg_scaling_policy_low_cpu" {
  source             = "../../modules/autoscaling/scaling-policy"
  asg_name           = module.autoscaling_group.asg_name
  name               = "LowCpu"
  adjustment_type    = "ChangeInCapacity"
  scaling_adjustment = -1
  cooldown           = 300
}

# Alarm & AlertManager
module "cloudwatch_alarm_high_cpu" {
  source              = "../../modules/cloudwatch/alarm"
  name                = var.alarm_high_cpu_name
  namespace           = "AWS/EC2"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  evaluation_periods  = "1"
  period              = "60"
  statistics          = "Average"
  threshold           = "75"

  dimensions = {
    AutoScalingGroupName = module.autoscaling_group.asg_name
  }

  alarm_actions = [
    module.asg_scaling_policy_high_cpu.asg_policy_arn
  ]

  application = var.Application
  environment = var.Environment
  team        = var.Team
  project     = var.Project
}

module "cloudwatch_alarm_low_cpu" {
  source              = "../../modules/cloudwatch/alarm"
  name                = var.alarm_low_cpu_name
  namespace           = "AWS/EC2"
  comparison_operator = "LessThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  evaluation_periods  = "1"
  period              = "60"
  statistics          = "Average"
  threshold           = "55"

  dimensions = {
    AutoScalingGroupName = module.autoscaling_group.asg_name
  }

  alarm_actions = [
    module.asg_scaling_policy_low_cpu.asg_policy_arn
  ]

  application = var.Application
  environment = var.Environment
  team        = var.Team
  project     = var.Project
}


