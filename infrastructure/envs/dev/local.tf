locals {

  /*
   *  AWS Selected region
   */
  aws_region = data.aws_region.current.region

  /* 
   *  AWS Skills accelerator conventions
   */
  cohort_type  = "asac"
  cohort       = "ch01"
  project_name = "${local.default_tags.OwnedBy}-car-platform"

  /*
   * AMI ID for the cluster capacity provider
   */


  /*
   *  VPC CIDR
   */

  /*
   *  Availability zones (Pick 3 AZs in given region and sort alphabetically)
   */
  azs = slice(sort(data.aws_availability_zones.current.names), 0, 3)



  /*
   * ECS service naming convention
   */
  ecs_service_name_prefix = "elite-autotrader-platform"

  /*
   * SSM Parameter store naming convention
   */
  ssm_parameter_name_prefix = "${local.default_tags.OwnedBy}/elite-autotrader-platform/${local.default_tags.Environment}"

  /*
   * Default tags
   */
  default_tags = {
    Project     = "AWSSkillsAcceleratorContainers"
    ManagedBy   = "<FILL_EMAIL_ADDRESS>"
    Environment = "dev"
    OwnedBy     = "siba"
  }
}
