resource "helm_release" "external-dns" {
  chart = "../charts/external-dns"
  name  = "external-dns"
  set {
    name  = "domain_name"
    value = var.domain_name
  }
  set {
    name  = "hosted_zone_id"
    value = var.hosted_zone_id
  }
  set {
    name  = "namespace"
    value = var.namespace
  }
}
