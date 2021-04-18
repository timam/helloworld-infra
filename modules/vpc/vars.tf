variable "vpc_cidr_block" {
  type = string
}

variable "vpc_tags" {
  type = map(string)
}

variable "domain_name" {
  type = string
}

variable "domain_name_servers" {
  type    = list(string)
  default = ["AmazonProvidedDNS"]
}

variable "igw_tags" {
  type = map(string)
}

variable "eip_tags" {
  type = map(string)
}

variable "nat_gw_tags" {
  type = map(string)
}

variable "public_subnets" {}

variable "public_route_table_cidr_block" {
  type = string
}

variable "public_route_table_tags" {
  type = map(string)
}

variable "private_subnets" {}

variable "private_route_table_cidr_block" {
  type = string
}

variable "private_route_table_tags" {
  type = map(string)
}

variable "private_route_table_cidrs" {
  type = map(string)
}