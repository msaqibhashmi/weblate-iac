variable "alias_record" {
  type = string
}
variable "zone_id" {
  type = string
}
variable "name" {
  type = list(string)
}
variable "domain" {
  type = string
}
variable "type" {
  default = "A"
  type    = string
}
variable "ttl" {
  default = "300"
  type    = string
}
variable "records" {
  default = null
}
variable "weight" {
  default = "10"
  type    = string
}
variable "set_identifier" {
  type = string
}
variable "lb_dns_name" {
  default = null
  type    = string
}
variable "lb_zone_id" {
  default = null
  type    = string
}
variable "target_health" {
  default = false
  type    = string
}
