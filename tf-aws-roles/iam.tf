module "tfc_deployment_role_lab_kehe" {
  source = "./modules/scalr-deployment-role"

  role_name              = "scalr-deployment"
  #scalr_trusted_role_arn = "arn:aws:iam::${local.aws_account_id_scalr}:user/scalr-saas"
  scalr_trusted_role_arn = "arn:aws:iam::340526426765:role/tf-create-prod"
  external_id            = "7s69Su5fAeYIBJSw"


  product      = "infrastructure"
  service      = "terraform-cloud"
  stage        = "prod"
  #boundary_arn = "arn:aws:iam::${local.aws_account_id_lab}:policy/Boundary_EngResearch"
}

