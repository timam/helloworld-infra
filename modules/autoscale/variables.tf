variable "name" {}
variable "max_size" {
  type = number
}
variable "min_size" {
  type = number
}
variable "desired_capacity" {
  type = number
}
variable "vpc_zone_identifier" {
  type = list(string)
}
variable "launch_template" {}
