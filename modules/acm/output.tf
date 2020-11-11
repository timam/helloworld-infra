output "acm-arn" {
  value = aws_acm_certificate.acm.arn
}
output "resource_record_name" {
#  value = aws_acm_certificate.acm.domain_validation_options.0.resource_record_name
  value = element(tolist(aws_acm_certificate.acm.domain_validation_options), 0).resource_record_name
}
output "resource_record_type" {
#  value = aws_acm_certificate.acm.domain_validation_options.0.resource_record_type
  value = element(tolist(aws_acm_certificate.acm.domain_validation_options), 0).resource_record_type
}
output "resource_record_value" {
#  value = aws_acm_certificate.acm.domain_validation_options.0.resource_record_value
  value = element(tolist(aws_acm_certificate.acm.domain_validation_options), 0).resource_record_value
}