resource "aws_route53_record" "route53_record_without_alias" {
  count   = var.alias_record == "true" ? 0 : length(var.name)
  zone_id = var.zone_id
  name    = join(".", [element(var.name, count.index), var.domain])
  type    = var.type
  ttl     = var.ttl
  records = var.records

  weighted_routing_policy {
    weight = var.weight
  }

  set_identifier = var.set_identifier
}

resource "aws_route53_record" "route53_record_with_alias" {
  count   = var.alias_record == "true" ? length(var.name) : 0
  zone_id = var.zone_id
  name    = join(".", [element(var.name, count.index), var.domain])
  type    = var.type

  weighted_routing_policy {
    weight = var.weight
  }

  set_identifier = var.set_identifier

  alias {
    name                   = var.lb_dns_name
    zone_id                = var.lb_zone_id
    evaluate_target_health = var.target_health
  }
}