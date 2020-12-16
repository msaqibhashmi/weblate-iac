variable "zone_name" {
  type = list(string)
}
variable "comment" {
  default = null
  type    = string
}
variable "vpc_id" {
  type = string
}
variable "Application" {
  type = string
}
variable "Environment" {
  type = string
}
variable "Team" {
  type = string
}
variable "Project" {
  type = string
}
