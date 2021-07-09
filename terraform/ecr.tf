module "helloworld-backend" {
  source = "../modules/ecr"
  name   = "${local.env}-${local.project}-backend"
  tags   = merge(map("Name", join("-", [local.env, local.project, "backend"])), map("ResourceType", "ecr"), local.common_tags)
}
module "helloworld-frontend" {
  source = "../modules/ecr"
  name   = "${local.env}-${local.project}-frontend"
  tags   = merge(map("Name", join("-", [local.env, local.project, "frontend"])), map("ResourceType", "ecr"), local.common_tags)
}
