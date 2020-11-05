#variable "instance_type" {}
variable "asg_mixed_instance_types" {}
variable "spot_instance_pools" {
  type = number
  default = "2"
}
variable "spot_allocation_strategy" {}
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
variable "policy_enabled" {
  default = false
  type = bool
}


variable "scale-up-policy" {
  default = false
  type = bool
}
variable "scale-down-policy" {
  default = false
  type = bool
}
variable "on_demand_percentage_above_base_capacity" {
  default = 70
  type = number
}
//variable "tags" {
//  type = list(map(string))
//}