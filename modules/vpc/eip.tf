resource "aws_eip" "main" {
  vpc  = true
  tags = var.eip_tags

  lifecycle {
    # prevent_destroy = true
  }
}