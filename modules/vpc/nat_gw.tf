resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public[keys(var.public_subnets)[0]].id
  tags          = var.nat_gw_tags

  lifecycle {
    # prevent_destroy = true
  }
}
