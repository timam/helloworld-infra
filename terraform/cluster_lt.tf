data "aws_ssm_parameter" "eks-ami-18" {
  name = "/aws/service/eks/optimized-ami/1.18/amazon-linux-2/recommended/image_id"
}

module "eks-launch-template" {
  source = "../modules/launch-template"
  iam_instance_profile = module.eks-worker-role.instances-profile
  image_id = data.aws_ssm_parameter.eks-ami-18.value
  instance_tags = merge(map("Name",join("-",[local.env,local.project,"eks-worker"])),map("ResourceType","ec2"),map("kubernetes.io/cluster/${module.eks-cluster.cluster_name}","owned"),local.common_tags)
  instance_type = local.instance_type
  key_name = module.worker-node-keypair.name
  name = "${local.env}-${local.project}-eks-lt"
  tags = merge(map("Name",join("-",[local.env,local.project,"eks-lt"])),map("ResourceType","lt"),local.common_tags)
  volume_tags = merge(map("Name",join("-",[local.env,local.project,"eks-worker-storage"])),map("ResourceType","ebs"),local.common_tags)
  vpc_security_group_ids = [aws_security_group.eks-worker.id]
  user_data = base64encode(local.eks-worker-node-userdata)
}
