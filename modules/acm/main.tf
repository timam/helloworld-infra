resource "aws_acm_certificate" "acm" {
  domain_name = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method = "DNS"
  tags = var.tags
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "acm-validation" {
  certificate_arn = aws_acm_certificate.acm.arn
  validation_record_fqdns = [var.validation_record_fqdns]
}