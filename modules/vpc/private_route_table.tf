resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  lifecycle {
    # prevent_destroy = true
  }

  tags = var.private_route_table_tags
}

resource "aws_route_table_association" "private" {
  for_each       = var.private_subnets
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private[each.key].id
}

resource "aws_route" "nat_gw" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = var.private_route_table_cidr_block
  nat_gateway_id         = aws_nat_gateway.main.id
}