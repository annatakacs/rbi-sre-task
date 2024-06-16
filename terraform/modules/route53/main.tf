resource "aws_route53_record" "record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.route_name
  type    = var.route_type
  ttl     = var.route_ttl
  records = var.route_records
}

data "aws_route53_zone" "selected" {
  name         = var.zone_name
  private_zone = var.private_zone
}