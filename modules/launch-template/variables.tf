variable "vpc_security_group_ids" {
  type = list(string)
}
variable "name" {}
variable "iam_instance_profile" {}
variable "image_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "tags" {
  type = map(string)
}
variable "instance_tags" {
  type = map(string)
}
variable "volume_tags" {
  type = map(string)
}
variable "user_data" {}