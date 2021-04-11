variable "name" {}
variable "subnet_ids" {}
variable "tags" {
  type = map(string)
}
variable "security_group_ids" {
  type = list(string)
}