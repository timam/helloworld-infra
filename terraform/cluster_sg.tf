resource "aws_security_group" "eks-master" {
  name = "${local.env}-${local.project}-eks-master"
  vpc_id = data.aws_vpc.vpc.id
  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = [data.aws_vpc.vpc.cidr_block]
  }
  ingress {
    from_port = 0
    protocol = -1
    to_port = 0
    self = true
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(map("Name",join("-",[local.env,local.project,"eks-master-sg"])),map("ResourceType","sg"),local.common_tags)
}

resource "aws_security_group" "eks-worker" {
  name = "${local.env}-${local.project}-eks-worker"
  vpc_id = data.aws_vpc.vpc.id
  lifecycle {
    ignore_changes = [ingress, egress]
  }
  ingress {
    from_port = 0
    protocol = -1
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(map("Name",join("-",[local.env,local.project,"eks-worker-sg"])),map("ResourceType","sg"),local.common_tags)
}