output "aws_iam_role_name" {
  value = aws_iam_role.IAMRoleGeneric.name
}

output "aws_iam_role_arn" {
  value = aws_iam_role.IAMRoleGeneric.arn
}

output "aws_iam_policy_arn" {
  value = aws_iam_policy.IAMRoleGenericPermissions.arn
}
