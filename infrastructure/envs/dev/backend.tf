terraform {
  backend "s3" {
    bucket       = "awsskillsacceleratorterraformstatedevsn"
    key          = "dev/terraform.tfstate"
    use_lockfile = true
    encrypt      = true
    region       = "af-south-1"
  }
}
