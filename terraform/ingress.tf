//module "alb-ingress-controller" {
//  source       = "../tf-modules/alb-ingress-controller"
//  region       = "ap-southeast-1"
//  cluster_name = module.eks-cluster.cluster_name
//  vpc_id       = data.aws_vpc.recurring.id
//}
//
//module "private-alb-ingress" {
//  source    = "../tf-modules/private-alb-ingress"
//  namespace = local.project
//
//  certificate_arn  = module.acm.acm-arn
//  healthcheck_path = "/"
//  private_subnet1  = data.aws_subnet.private-subnet-1a.id
//  private_subnet2  = data.aws_subnet.private-subnet-1b.id
//  private_subnet3  = data.aws_subnet.private-subnet-1c.id
//
//  values = <<EOF
//services:
//  cps:
//    service_url:  "cps.${local.domain-name}"
//    service_name: "${module.cps.microservice_name}"
//    service_port: "${module.cps.service_port}"
//EOF
//}
