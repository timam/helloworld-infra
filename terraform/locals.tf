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
    sit = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7ro+mNHphqACjCPzodkeUBvjWDqeveAo8vKCWwbjCpqesrEcbFPxxBdh4c3V8bihQ+BTHqTRiuMxYQOSlGpD7IsXoIO6AUb1Huji5NhniQnPPsquhJrN7tHoIvEtsSttmoB34dHkNK9WpdyLU/3NKQDBrNLAqG1xmm9FHTGxElBqKBOcRXYkpso7H+YCtclCympBSrO1Y78n+rwjnb42tLuhn3zEmGBngkz5tJYdNkWwuoIE5k5LSZQD3T2WuAIf4IZyKLtP2zZDHjtq08P+n1fXH8Jzfj+gaeRcywgHncjBAmsm7gxFC5E/RU+G8CUe0E+6q40ddaZ+dgg1dhknx"
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