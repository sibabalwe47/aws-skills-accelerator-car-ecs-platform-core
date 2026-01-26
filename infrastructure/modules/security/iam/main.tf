resource "aws_iam_role" "IAMRoleGeneric" {
  name               = var.iam_role_generic_name
  assume_role_policy = jsonencode(var.iam_role_generic_policy)
}


resource "aws_iam_policy" "IAMRoleGenericPermissions" {
  name   = "${aws_iam_role.IAMRoleGeneric.name}AssumeRolePolicies"
  policy = jsonencode(var.iam_role_generic_permissions)
}

resource "aws_iam_policy_attachment" "IAMRoleGenericPermissionsAttachment" {
  name       = "${aws_iam_role.IAMRoleGeneric.name}PermissionsAttachment"
  roles      = [aws_iam_role.IAMRoleGeneric.name]
  policy_arn = aws_iam_policy.IAMRoleGenericPermissions.arn
}
