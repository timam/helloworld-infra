resource "helm_release" "deployment" {
  name             = var.microservice_name
  chart            = "../charts/deployment"
  namespace        = var.namespace
  cleanup_on_fail  = true
  create_namespace = true
  set {
    name  = "env"
    value = var.env
  }
  set {
    name  = "microservice_name"
    value = var.microservice_name
  }
  set {
    name  = "health_check_path"
    value = var.health_check_path
  }
  set {
    name  = "docker_image"
    value = var.docker_image
  }
  set {
    name  = "docker_image_tag"
    value = var.docker_image_tag
  }
  set {
    name  = "container_port"
    value = var.container_port
  }
  set {
    name  = "service_port"
    value = var.service_port
  }
  set {
    name  = "service_type"
    value = var.service_type
  }
  set {
    name  = "replicas"
    value = var.replicas
  }
  set {
    name  = "memory_request"
    value = var.memory_request
  }
  set {
    name  = "cpu_request"
    value = var.cpu_request
  }
  set {
    name  = "memory_limit"
    value = var.memory_limit
  }
  set {
    name  = "cpu_limit"
    value = var.cpu_limit
  }
  set {
    name  = "liveness_prob_delay"
    value = var.liveness_prob_delay
  }
  set {
    name  = "liveness_prob_delay"
    value = var.liveness_prob_delay
  }
  set {
    name  = "liveness_prob_period"
    value = var.liveness_prob_period
  }
  set {
    name  = "readiness_prob_delay"
    value = var.readiness_prob_delay
  }
  set {
    name  = "readiness_prob_period"
    value = var.readiness_prob_period
  }
  set {
    name  = "terminate_grace_period"
    value = var.terminate_grace_period
  }

}