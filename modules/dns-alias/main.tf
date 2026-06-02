resource "aws_route53_record" "alias" {
  zone_id = var.hosted_zone_id

  type = "A"

  name    = var.alias.from
  records = [var.alias.to]
}
