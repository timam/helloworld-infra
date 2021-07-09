resource "aws_security_group" "private-alb" {
  name   = "${local.env}-${local.project}-private-alb"
  vpc_id = data.aws_vpc.vpc.id
  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = [data.aws_vpc.vpc.cidr_block]
  }
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = [data.aws_vpc.vpc.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(map("Name", join("-", [local.env, local.project, "private-alb"])), map("ResourceType", "sg"), local.common_tags)
}

resource "aws_security_group" "public-alb" {
  name   = "${local.env}-${local.project}-public-alb"
  vpc_id = data.aws_vpc.vpc.id
  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(map("Name", join("-", [local.env, local.project, "public-alb"])), map("ResourceType", "sg"), local.common_tags)
}
