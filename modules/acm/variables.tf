variable "domain_name" {}
variable "subject_alternative_names" {
  default = []
  type = list(string)
}
variable "tags" {
  type = map(string)
}
variable "validation_record_fqdns" {
  type = string
}
