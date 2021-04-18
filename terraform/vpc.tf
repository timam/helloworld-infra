module "vpc" {
  source = "../modules/vpc"

  vpc_cidr_block = local.vpc_cidr_block
  domain_name    = local.vpc_domain_name
  vpc_tags = merge({
    Name         = join("-", [local.env, local.project_name, "vpc"])
    ResourceType = "VPC"
  }, local.common_tags)

  igw_tags = merge({
    Name         = join("-", [local.env, local.project_name, "igw"])
    ResourceType = "IGW"
  }, local.common_tags)
  eip_tags = merge({
    Name         = join("-", [local.env, local.project_name, "eip"])
    ResourceType = "EIP"
  }, local.common_tags)
  nat_gw_tags = merge({
    Name         = join("-", [local.env, local.project_name, "nat-gw"])
    ResourceType = "NAT GW"
  }, local.common_tags)

  public_subnets  = local.public_subnets
  private_subnets = local.private_subnets

  public_route_table_cidr_block = "0.0.0.0/0"
  public_route_table_tags = merge({
    Name         = join("-", [local.env, local.project_name, "public"])
    ResourceType = "ROUTE-TABLE"
  }, local.common_tags)

  private_route_table_cidr_block = "0.0.0.0/0"
  private_route_table_tags = merge({
    Name         = join("-", [local.env, local.project_name, "private"])
    ResourceType = "ROUTE-TABLE"
  }, local.common_tags)

  private_route_table_cidrs = merge(local.private_route_table_cidrs)
}