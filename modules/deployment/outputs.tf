output "microservice_name" {
  value = var.microservice_name
}
output "health_check_path" {
  value = var.health_check_path
}
output "docker_image" {
  value = var.docker_image
}
output "docker_image_tag" {
  value = var.docker_image_tag
}
output "container_port" {
  value = var.container_port
}
output "service_port" {
  value = var.service_port
}
output "service_type" {
  value = var.service_type
}
output "replicas" {
  value = var.replicas
}
output "memory_request" {
  value = var.memory_request
}
output "cpu_request" {
  value = var.cpu_request
}
output "memory_limit" {
  value = var.memory_limit
}
output "cpu_limit" {
  value = var.cpu_limit
}
output "liveness_prob_delay" {
  value = var.liveness_prob_delay
}
output "liveness_prob_period" {
  value = var.liveness_prob_period
}
output "readiness_prob_delay" {
  value = var.readiness_prob_delay
}
output "readiness_prob_period" {
  value = var.readiness_prob_period
}
output "terminate_grace_period" {
  value = var.terminate_grace_period
}