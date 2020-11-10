module "acm" {
  source = "../modules/acm"
  domain_name = "*.${aws_route53_zone.domain.name}"
  subject_alternative_names = aws_route53_zone.domain.name
  validation_record_fqdns = aws_route53_record.cert-validation.fqdn
  tags  = merge(map("Name",join("-",[local.env,local.project,"wildcard-acm"])),map("ResourceType","ACM"),local.common_tags)
}
