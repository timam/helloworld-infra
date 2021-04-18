module "eks-cluster" {
  source = "../modules/eks"
  eksVersion = local.eksVersion
  name = "${local.env}-${local.project}-eks-cluster"
  subnet_ids = module.vpc.private_subnet_ids
  tags = merge(map("Name",join("-",[local.env,local.project,"eks-cluster"])),map("ResourceType","eks-master"),local.common_tags)
  security_group_ids = [aws_security_group.eks-master.id]
}
