locals {
  helmChartValues = {
    env = local.env

    aws_account_id = data.aws_caller_identity.current.id
    region = data.aws_region.current.name
    project = local.project
    domain_name = local.domain_name

    alb_ingress = {
      replicas  = "2"
      namespace = "kube-system"
      private_security_group = aws_security_group.private-alb.id
      public_security_group  = aws_security_group.public-alb.id
      certificate_arn = module.acm.acm-arn
      private_subnet1 = data.aws_subnet.private-subnet-1b.id
      private_subnet2 = data.aws_subnet.private-subnet-1c.id
      public_subnet1  = data.aws_subnet.public-subnet-1a.id
      public_subnet2  = data.aws_subnet.public-subnet-1b.id
      inbound_cidr    = data.aws_vpc.vpc.cidr_block
    }

    modules = {
      backend = {
        name            = "backend"
        containerPort   = "8010"
        servicePort     = "8010"
        replicas        = "3"
        maxreplicas     = "20"
        requests_memory = "1024Mi"
        limit_memory    = "4096Mi"
        requests_cpu    = "500m"
        limit_cpu       = "1000m"
        serviceType     = "NodePort"
      }
      frontend = {
        name            = "frontend"
        containerPort   = "8020"
        servicePort     = "8020"
        replicas        = "3"
        maxreplicas     = "20"
        requests_memory = "1024Mi"
        limit_memory    = "4096Mi"
        requests_cpu    = "500m"
        limit_cpu       = "1000m"
        serviceType     = "NodePort"
      }
    }

  }
}

resource "local_file" "helm-values" {
  content     = yamlencode(local.helmChartValues)
  filename = "${path.module}/values.yaml"
}

resource "helm_release" "helloworld" {
  name  = "${local.env}-${local.project}"
  chart = "../helm"
  max_history      = 500
  namespace        = local.project
  create_namespace = true
  values = [
    local_file.helm-values.content
  ]
  set {
    name = "version"
    value = var.helm_version
  }
}
