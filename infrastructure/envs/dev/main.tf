/***
    Bootstrap
***/
module "bootstrap_environment" {
  source = "../../modules/bootstrap"

  terraform_state_bucket_name = var.terraform_state_bucket_name

}


/***
    GitHub OIDC Configuration
***/
module "github_oidc_provider" {
  source = "../../modules/security/oidc"
}
