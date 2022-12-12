module "tfc_deployment_role_lab" {
  source = "./modules/scalr-deployment-role"

  role_name              = "scalr-deployment"
  scalr_trusted_role_arn = "arn:aws:iam::${local.aws_account_id_scalr}:user/scalr-saas"
  external_id            = "7s69Su5fAeYIBJSw"


   product      = "infrastructure"
   service      = "terraform-scalr"
   stage        = "prod"
  #                 boundary_arn = "arn:aws:iam::${local.aws_account_id_lab}:policy/Boundary_EngResearch"
}

