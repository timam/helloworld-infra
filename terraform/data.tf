data "aws_vpc" "vpc" {
  id = "vpc-84fa6ce3"
}

data "aws_subnet" "private-subnet-1b" {
  id = "subnet-7369383a"
}

data "aws_subnet" "private-subnet-1c" {
  id = "subnet-59c0dd1f"
}