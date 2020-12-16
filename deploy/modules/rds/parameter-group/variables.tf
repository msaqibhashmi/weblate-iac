variable "parameter_group_name" {
  type = string
}
variable "family" {
  type = string
}
variable "description" {
  type    = string
  default = "DB Parameter Group."
}
variable "parameters" {
  type = list(object({
    name = string
    value = string
    apply_method = string
  }))
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
