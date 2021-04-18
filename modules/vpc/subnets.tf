resource "aws_subnet" "public" {
  for_each          = var.public_subnets
  cidr_block        = each.key
  availability_zone = lookup(each.value, "hosted_zone")
  vpc_id            = aws_vpc.main.id
  tags              = lookup(each.value, "tags")

  lifecycle {
    # prevent_destroy = true
  }
}

resource "aws_subnet" "private" {
  for_each          = var.private_subnets
  cidr_block        = each.key
  availability_zone = lookup(each.value, "hosted_zone")
  vpc_id            = aws_vpc.main.id
  tags              = lookup(each.value, "tags")

  lifecycle {
    ignore_changes = [
      tags
    ]
    # prevent_destroy = true
  }
}