//module "cps" {
//  source    = "../tf-modules/deployment"
//  env       = local.env
//  namespace = local.project
//
//  microservice_name = "${local.project}-cps"
//  health_check_path = "/cps/actuator/health"
//  docker_image      = module.ecr-cps.ecr_url
//  docker_image_tag  = "880dbdc57ca1bf2474a49027a531255617ea4535"
//  container_port    = "8080"
//  service_port      = "8001"
//}
