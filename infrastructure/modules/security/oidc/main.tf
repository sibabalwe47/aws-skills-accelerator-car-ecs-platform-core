resource "aws_iam_openid_connect_provider" "github_oidc_provider" {
  client_id_list  = ["sts.${data.aws_partition.current.dns_suffix}"]
  thumbprint_list = [var.iam_openid_connect_thumbprint_list]
  url             = var.iam_github_user_content_token_actions_url
}


module "github_oidc_provider_role" {
  source = "../iam"

  iam_role_generic_name = var.github_iam_role_name

  iam_role_generic_policy = {
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Sid    = "GitHubActionPermissions"
        Principal = {
          Federated = "${aws_iam_openid_connect_provider.github_oidc_provider.arn}"
        }
        Condition = {
          StringEquals = {
            "${element(split("oidc-provider/", "${aws_iam_openid_connect_provider.github_oidc_provider.arn}"), 1)}:aud" : "sts.amazonaws.com",
            "${element(split("oidc-provider/", "${aws_iam_openid_connect_provider.github_oidc_provider.arn}"), 1)}:sub" : var.allowed_github_repositories
          }
        }
      }
    ]
  }

  iam_role_generic_permissions = {
    Version   = "2012-10-17"
    Statement = var.github_iam_role_policy_permissions
  }

}
