variable "env" {}
variable "namespace" {}
variable "microservice_name" {}
variable "health_check_path" {}
variable "docker_image" {}
variable "docker_image_tag" {}
variable "container_port" {}
variable "service_port" {}

variable "service_type" {
  default = "NodePort"
}
variable "replicas" {
  default = 2
}
variable "memory_request" {
  default = "512Mi"
}
variable "cpu_request" {
  default = "250m"
}
variable "memory_limit" {
  default = "4096Mi"
}
variable "cpu_limit" {
  default = "500m"
}
variable "liveness_prob_delay" {
  default = 60
}
variable "liveness_prob_period" {
  default = 25
}
variable "readiness_prob_delay" {
  default = 60
}
variable "readiness_prob_period" {
  default = 25
}
variable "terminate_grace_period" {
  default = 60
}