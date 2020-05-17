resource "aws_key_pair" "keypair" {
  public_key = var.public_key
  key_name = var.key_name
  lifecycle {
    prevent_destroy = true
  }
}
