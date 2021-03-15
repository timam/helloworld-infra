resource "helm_release" "alb-ingress-controller" {
  name             = "alb-ingress-controller"
  chart            = "../charts/alb-ingress-controller"
  create_namespace = true
  set {
    name  = "region"
    value = var.region
  }
  set {
    name = "vpc_id"
    value = var.vpc_id
  }
  set {
    name  = "cluster_name"
    value = var.cluster_name
  }
}