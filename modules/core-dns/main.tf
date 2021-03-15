resource "helm_release" "core-dns" {
  name  = "core-dns"
  chart = "../charts/core-dns"
  set {
    name  = "dns_resolver"
    value = var.dns_resolver
  }
  set {
    name  = "cps_domain"
    value = var.cps_domain
  }
  set {
    name  = "release_namespace"
    value = var.release_namespace
  }
  set {
    name  = "release_name"
    value = var.release_name
  }

}