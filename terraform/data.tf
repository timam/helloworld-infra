data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_vpc" "vpc" {
  id = "vpc-84fa6ce3"
}

data "aws_subnet" "private-subnet-1b" {
  id = "subnet-7369383a"
}

data "aws_subnet" "private-subnet-1c" {
  id = "subnet-59c0dd1f"
}
data "aws_subnet" "public-subnet-1a" {
  id = "subnet-4978670f"
}

data "aws_subnet" "public-subnet-1b" {
  id = "subnet-bf092df6"
}
