resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags   = var.igw_tags

  lifecycle {
    # prevent_destroy = true
  }
}