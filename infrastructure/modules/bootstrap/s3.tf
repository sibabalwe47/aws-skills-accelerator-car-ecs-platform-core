/*
  Bucket: 
*/
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = var.terraform_state_bucket_name
}

/*
  Bucket ACLs: 
*/
resource "aws_s3_bucket_ownership_controls" "terraform_state_bucket_acls" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  rule {
    object_ownership = "BucketOwnerEnforced" # or "ObjectWriter"
  }
}

/*
    Block public access:
 */
resource "aws_s3_bucket_public_access_block" "terraform_state_bucket_pab" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

/*
    Bucket Versioning: 
 */
resource "aws_s3_bucket_versioning" "terraform_state_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

/*
    Bucket Encryption: 
 */
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_bucket_encryption" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

/*
    Bucket Enforce TLS: 
 */
data "aws_iam_policy_document" "terraform_state_bucket_policy" {
  statement {
    sid     = "DenyInsecureTransport"
    effect  = "Deny"
    actions = ["s3:*"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    resources = [
      aws_s3_bucket.terraform_state_bucket.arn,
      "${aws_s3_bucket.terraform_state_bucket.arn}/*"
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}

/*
 Bucket Policy (Attach):
*/
resource "aws_s3_bucket_policy" "terraform_state_bucket_attach_policy" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  policy = data.aws_iam_policy_document.terraform_state_bucket_policy.json
}
