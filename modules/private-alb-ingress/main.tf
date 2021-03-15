resource "helm_release" "private-alb-ingress" {
  chart     = "../charts/private-alb"
  name      = "private-alb-ingress"
  namespace = var.namespace
  set {
    name  = "private_subnet1"
    value = var.private_subnet1
  }
  set {
    name  = "private_subnet2"
    value = var.private_subnet2
  }
  set {
    name  = "private_subnet3"
    value = var.private_subnet3
  }
  set {
    name  = "certificate_arn"
    value = var.certificate_arn
  }
  set {
    name  = "healthcheck_path"
    value = var.healthcheck_path
  }
  values = [var.values]
}
