//module "helloworld-spring" {
//  source = "../modules/ecr"
//  name = "${local.env}-${local.project}-spring"
//  tags = merge(map("Name",join("-",[local.env,local.project,"status"])),map("ResourceType","ecr"),local.common_tags)
//}
