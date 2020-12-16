variable "port" {
}
variable "protocol" {
}

variable "vpc_id" {
}

variable "healthy_threshold" {
}

variable "unhealthy_threshold" {
}

variable "interval" {
}

variable "path" {
  default = null
}

variable "name" {
}

variable "application" {
}

variable "environment" {
}

variable "team" {
}

variable "project" {
}

# lb_cookie use for alb, and source_ip is use for nlb
variable "stickiness_type" {
  default = "lb_cookie"
}

variable "stickiness_cookie_duration" {
  default = 1
}

variable "stickiness_enabled" {
  default = false
}
