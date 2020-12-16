variable "subnet_name" {
  type = string
}
variable "subnet_ids" {
  default = []
  type    = list(string)
}
variable "description" {
  type    = string
  default = "DB Subnet Group"
}

# Tags
variable "name" {
  type = string
}
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
