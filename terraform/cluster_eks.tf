module "eks-cluster" {
  source = "../modules/eks"
  name = "${local.env}-${local.project}-eks-cluster"
  subnet_ids = [data.aws_subnet.private-subnet-1b.id, data.aws_subnet.private-subnet-1c.id]
  tags = merge(map("Name",join("-",[local.env,local.project,"eks-cluster"])),map("ResourceType","eks-master"),local.common_tags)
  security_group_ids = [aws_security_group.eks-master.id]
}
