/***
    Bootstrap
***/
module "bootstrap_environment" {
  source = "../../modules/bootstrap"

  terraform_state_bucket_name = var.terraform_state_bucket_name

}
