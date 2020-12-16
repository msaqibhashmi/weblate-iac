variable "name" {
  type = string
}
variable "alarm_description" {
  description = "Cloud watch alarm description."
  type        = string
  default     = null
}
variable "namespace" {
  type    = string
  default = "AWS/EC2"
}
variable "comparison_operator" {
  type = string
}
variable "metric_name" {
  type = string
}
variable "evaluation_periods" {
  type = number
}
variable "period" {
  type = string
}
variable "statistics" {
  type = string
}
variable "threshold" {
  type = number
}
variable "dimensions" {
  type = any
}
variable "alarm_actions" {
  type = list(string)
}

# Tags
variable "application" {
  type = string
}
variable "environment" {
  type = string
}
variable "team" {
  type = string
}
variable "project" {
  type = string
}
