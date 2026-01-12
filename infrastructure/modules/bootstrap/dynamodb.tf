# resource "aws_dynamodb_table" "terraform_state_lock_table" {
#   name         = var.terraform_state_lock_table_name
#   billing_mode = var.terraform_state_lock_table_billing_mode
#   hash_key     = "PK"
#   range_key    = "LockID"

#   attribute {
#     name = "PK"
#     type = "S"
#   }

#   attribute {
#     name = "LockID"
#     type = "S"
#   }

#   server_side_encryption {
#     enabled = true
#   }
# }
