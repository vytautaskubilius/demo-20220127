module "vpc" {
  source           = "git@github.com:gruntwork-io/terraform-aws-vpc.git//modules/vpc-app?ref=v0.18.9"
  aws_region       = "us-east-1"
  cidr_block       = "10.42.0.0/16"
  num_nat_gateways = 0
  vpc_name         = "foo"
}
