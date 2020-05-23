module "helloworld-go" {
  source = "../modules/ecr"
  name = "${local.env}-${local.project}-go"
  tags = merge(map("Name",join("-",[local.env,local.project,"status"])),map("ResourceType","ecr"),local.common_tags)
}

module "helloworld-django" {
  source = "../modules/ecr"
  name = "${local.env}-${local.project}-django"
  tags = merge(map("Name",join("-",[local.env,local.project,"status"])),map("ResourceType","ecr"),local.common_tags)
}
