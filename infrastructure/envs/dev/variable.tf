/***
    Standard Project Variables (variables.tf)
***/
variable "aws_region" {
  default = "af-south-1"
}



/***
    Environment Specific Variables (terraform.tfvars)
***/
variable "terraform_state_bucket_name" {
  default = "awsskillsacceleratorterraformstatesn"
}
