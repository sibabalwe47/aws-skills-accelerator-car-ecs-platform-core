/*
    Resource: AWS Data Sources
    Description: Allow to query resource configuration from AWS (Region, AZs etc)
 */



/* 
    1. Environment configuration
*/
data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_availability_zones" "current" { state = "available" }


/*
    2. GitHub OIDC Configuration
 */


/*
    3. ECS Capacity Provider AMI Configuration
 */
