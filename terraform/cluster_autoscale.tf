module "eks-worker-asg" {
  source = "../modules/autoscale"
  policy_enabled = local.policy_enabled
  desired_capacity = local.desired_capacity
  launch_template = module.eks-launch-template.lt-id
  max_size = local.max_size
  min_size = local.min_size
  asg_mixed_instance_types = local.asg_mixed_instance_types
  spot_allocation_strategy = local.spot_allocation_strategy
  spot_instance_pools = local.spot_instance_pools
  name = "${local.env}-${local.project}-eks-worker-asg"
  //  tags = merge(map("Name",join("-",[local.env,local.project,"eks-worker-asg"])),map("ResourceType","asg"),local.common_tags)
  vpc_zone_identifier = [data.aws_subnet.private-subnet-1b.id, data.aws_subnet.private-subnet-1c.id]
  on_demand_percentage_above_base_capacity = local.on_demand_percentage_above_base_capacity
  scale-up-policy = local.scale-up-policy
  scale-down-policy = local.scale-down-policy
}
