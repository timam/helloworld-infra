module "eks-worker-asg" {
  source = "../modules/autoscale"
  desired_capacity = local.desired_capacity
  launch_template = module.eks-launch-template.lt-id
  max_size = local.max_size
  min_size = local.min_size
  name = "${local.env}-${local.project}-eks-worker-asg"
  vpc_zone_identifier = [data.aws_subnet.private-subnet-1b.id, data.aws_subnet.private-subnet-1c.id]

}
