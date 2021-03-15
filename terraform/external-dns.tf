//module "external-dns" {
//  source         = "../tf-modules/external-dns"
//  domain_name    = aws_route53_zone.domain-name.name
//  hosted_zone_id = aws_route53_zone.domain-name.zone_id
//  namespace      = local.project
//}