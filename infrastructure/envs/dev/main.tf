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

  github_iam_role_name = "GitHubActionAssumeRole"

  iam_openid_connect_thumbprint_list = [
    local.thumbprint_list
  ]

  iam_github_user_content_token_actions_url = local.github_action_trust_url

  allowed_github_repositories = [
    "sibabalwe47/aws-accelerator-cms-api/heads/main"
  ]

  github_iam_role_policy_permissions = [
    {
      Effect   = "Allow",
      Action   = "ecr:*"
      Resource = "*"
    }
  ]
}
