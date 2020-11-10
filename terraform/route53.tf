resource "aws_route53_zone" "domain" {
  name = local.domain_name
  lifecycle {
    prevent_destroy = true
  }
  tags = merge(map("Name",join("-",[local.env,local.project,"domain"])),map("ResourceType","ROUTE53"),local.common_tags)
}


resource "aws_route53_record" "cert-validation" {
  name = module.acm.resource_record_name
  type = module.acm.resource_record_type
  zone_id = aws_route53_zone.domain.zone_id
  records = [module.acm.resource_record_value]
  ttl = 10
}