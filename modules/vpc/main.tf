resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = var.vpc_tags

  lifecycle {
    # prevent_destroy = true
  }
}

# resource "aws_vpc_dhcp_options" "main" {
#   domain_name         = var.domain_name
#   domain_name_servers = var.domain_name_servers
#   tags                = var.vpc_tags

#   lifecycle {
#     # prevent_destroy = true
#   }
# }

# resource "aws_vpc_dhcp_options_association" "main" {
#   dhcp_options_id = aws_vpc_dhcp_options.main.id
#   vpc_id          = aws_vpc.main.id

#   lifecycle {
#     # prevent_destroy = true
#   }
# }