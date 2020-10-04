module "eks-worker-asg" {
  source = "../modules/autoscale"
  scale-up-policy   = local.scale-up-policy
  scale-down-policy = local.scale-down-policy
  max_size = local.max_size
  min_size = local.min_size
  desired_capacity = local.desired_capacity
  asg_mixed_instance_types = local.asg_mixed_instance_types
  spot_instance_pools      = local.spot_instance_pools
  spot_allocation_strategy = local.spot_allocation_strategy
  launch_template = module.eks-launch-template.lt-id
  name = "${local.env}-${local.project}-eks-worker"
  on_demand_percentage_above_base_capacity = local.on_demand_percentage_above_base_capacity
  tags = [
    {
      key                 = "Environment"
      value               = local.env
      propagate_at_launch = false
    },
    {
      key                 = "Owner"
      value               = local.owner
      propagate_at_launch = false
    },
    {
      key                 = "Cost-Center"
      value               = local.cost-center
      propagate_at_launch = false
    },
    {
      key                 = "Project"
      value               = local.project
      propagate_at_launch = false
    },
    {
      key                 = "k8s.io/cluster-autoscaler/${local.env}-${local.project}-eks-cluster"
      value               = "owned"
      propagate_at_launch = true
    },
    {
      key                 = "k8s.io/cluster-autoscaler/enabled"
      value               = "true"
      propagate_at_launch = true
    }
  ]
  vpc_zone_identifier = [data.aws_subnet.private-subnet-1b.id, data.aws_subnet.private-subnet-1c.id]
}