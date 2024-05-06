module "shared" {
  source = "../../modules/shared"
}

module "reko" {
  source = "../../modules/reko"

  env = "dev"

  infra_resource_group_name = module.shared.resource_group_name
  acr_name                  = module.shared.acr_name
}
