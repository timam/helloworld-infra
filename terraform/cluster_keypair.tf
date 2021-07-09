module "worker-node-keypair" {
  source     = "../modules/keypair"
  key_name   = "${local.env}-${local.project}-worker"
  public_key = local.worker-keypair
}