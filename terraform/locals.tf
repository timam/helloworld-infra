locals {
  env = terraform.workspace

  owner_team = {
    sit = "SE"
    uat = "SE"
    lt = "SE"
    prod = "SE"
  }
  owner = local.owner_team[local.env]

  costs = {
    sit = "devops"
    uat = "devops"
    lt = "devops"
    prod = "devops"
  }
  cost-center = local.costs[local.env]

  project_name = {
    sit = "helloworld"
    uat = "helloworld"
    lt = "helloworld"
    prod = "helloworld"
  }
  project = local.project_name[local.env]

  common_tags = {
    Environment = local.env
    Owner = local.owner
    Cost-Center = local.cost-center
    Project = local.project
  }

  tf_instance_type = {
    sit = "t3.xlarge"
    uat = "t3.xlarge"
    lt = "t3.xlarge"
    prod = "t3.xlarge"
  }
  instance_type = local.tf_instance_type[local.env]

  tf_worker-keypair = {
    sit = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFP13Y8TyBgKuCzGzrXItnIylgW6A49ykP7yUf7ZliVC2+oD+3EeDWhTKsQQsRaoio9+A+gq1IaNN+UVudUw7xJ7rXdF4LWfAtWsqXAb5bsHB7bsXNeeJ6/dXreK1wqcUbuorDuGVGnXCkIMjT/MVJXUyFSvw/18ns7wQOZO4ng7/9UdT3QBdjxaTP+n8JjRbLsY4fa4GYMfOLwN7sPwBURatijN7wxrnvaBIK+8FVPq2YE4jK0ypFe3JHFZnoob+hGDRCZBh9zNxh9Mai/G6sDMekBl3yFXlKyebB0OMN2BecO0+F44s/lVC/jbsIiU+3MPLOT0PFk1D53C+LLSpl"
    uat = ""
    prod = ""
    lt = ""
  }
  worker-keypair = local.tf_worker-keypair[local.env]
  tf_min_size = {
    sit = "1"
    uat = "1"
    prod = "1"
    lt = "1"
  }
  min_size = local.tf_min_size[local.env]

  tf_desired_capacity = {
    sit = "1"
    uat = "1"
    prod = "1"
    lt = "1"
  }
  desired_capacity = local.tf_desired_capacity[local.env]

  tf_max_size = {
    sit = "2"
    uat = "2"
    prod = "2"
    lt = "2"
  }
  max_size = local.tf_max_size[local.env]

  tf_asg_mixed_instance_types = {
    sit = {
      "m6g.xlarge" = "1"
      "m5.xlarge"  = "1"
      "m5a.xlarge" = "1"
      "c6g.xlarge" = "1"
    }
    uat = {
      "m6g.xlarge" = "1"
      "m5.xlarge"  = "1"
      "m5a.xlarge" = "1"
      "c6g.xlarge" = "1"
    }
    prod = {
      "m6g.xlarge" = "1"
      "m5.xlarge"  = "1"
      "m5a.xlarge" = "1"
      "c6g.xlarge" = "1"
    }

  }
  asg_mixed_instance_types = local.tf_asg_mixed_instance_types[local.env]

  tf-spot_allocation_strategy = {
    sit  = "lowest-price"
    uat  = "lowest-price"
    prod = "capacity-optimized"
  }
  spot_allocation_strategy = local.tf-spot_allocation_strategy[local.env]

  tf_spot_instance_pools = {
    sit  = "2"
    uat  = "2"
    prod = "0"
  }
  spot_instance_pools = local.tf_spot_instance_pools[local.env]

  tf_on_demand_percentage_above_base_capacity = {
    sit  = "100"
    uat  = "100"
    prod = "60"
  }
  on_demand_percentage_above_base_capacity = local.tf_on_demand_percentage_above_base_capacity[local.env]

  tf_scale-up-policy = {
    sit  = "false"
    uat  = "false"
    prod = "false"
  }
  scale-up-policy = local.tf_scale-up-policy[local.env]

  tf_scale-down-policy = {
    sit  = "true"
    uat  = "true"
    prod = "false"
  }
  scale-down-policy = local.tf_scale-down-policy[local.env]


  tf_eks-worker-node-userdata = {
    sit = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${module.eks-cluster.eks_endpoint}' --b64-cluster-ca '${module.eks-cluster.eks_certificate_authority[0].data}' '${module.eks-cluster.cluster_name}'
USERDATA
    uat = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${module.eks-cluster.eks_endpoint}' --b64-cluster-ca '${module.eks-cluster.eks_certificate_authority[0].data}' '${module.eks-cluster.cluster_name}'
USERDATA
    prod = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${module.eks-cluster.eks_endpoint}' --b64-cluster-ca '${module.eks-cluster.eks_certificate_authority[0].data}' '${module.eks-cluster.cluster_name}'
USERDATA
    lt = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${module.eks-cluster.eks_endpoint}' --b64-cluster-ca '${module.eks-cluster.eks_certificate_authority[0].data}' '${module.eks-cluster.cluster_name}'
USERDATA
  }
  eks-worker-node-userdata = local.tf_eks-worker-node-userdata[local.env]

}