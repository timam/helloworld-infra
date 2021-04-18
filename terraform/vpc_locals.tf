locals {
  vpc_cidr_block = lookup({
    uat  = "10.0.0.0/20"
    lt   = ""
    prod = ""
  }, local.env)

  vpc_domain_name = lookup({
    uat  = "uat.example.com"
    lt   = ""
    prod = ""
  }, local.env)

  private_subnets = lookup({
    uat = {
      "10.0.1.0/24" = {
        hosted_zone = "ap-southeast-1a"
        tags = merge({
          Name         = join("-", [local.env, local.project_name, "private", "ap-southeast-1a"])
          ResourceType = "SUBNET"
        }, local.common_tags)
      }
      "10.0.2.0/24" = {
        hosted_zone = "ap-southeast-1b"
        tags = merge({
          Name         = join("-", [local.env, local.project_name, "private", "ap-southeast-1b"])
          ResourceType = "SUBNET"
        }, local.common_tags)
      }
      "10.0.3.0/24" = {
        hosted_zone = "ap-southeast-1c"
        tags = merge({
          Name         = join("-", [local.env, local.project_name, "private", "ap-southeast-1c"])
          ResourceType = "SUBNET"
        }, local.common_tags)
      }
    }

    prod = {}
    lt   = {}
  }, local.env)

  public_subnets = lookup({
    uat = {
      "10.0.4.0/24" = {
        hosted_zone = "ap-southeast-1a"
        tags = merge({
          Name         = join("-", [local.env, local.project_name, "public", "ap-southeast-1a"])
          ResourceType = "SUBNET"
        }, local.common_tags)
      }
      "10.0.5.0/24" = {
        hosted_zone = "ap-southeast-1b"
        tags = merge({
          Name         = join("-", [local.env, local.project_name, "public", "ap-southeast-1b"])
          ResourceType = "SUBNET"
        }, local.common_tags)
      }
      "10.0.6.0/24" = {
        hosted_zone = "ap-southeast-1c"
        tags = merge({
          Name         = join("-", [local.env, local.project_name, "public", "ap-southeast-1c"])
          ResourceType = "SUBNET"
        }, local.common_tags)
      }
    }

    prod = {}
    lt = {}
  }, local.env)

  private_route_table_cidrs = {}
}