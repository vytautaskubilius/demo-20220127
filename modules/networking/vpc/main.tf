module "vpc" {
  source           = "git@github.com:gruntwork-io/terraform-aws-vpc.git//modules/vpc-app?ref=v0.18.9"
  aws_region       = "us-east-1"
  cidr_block       = "10.42.0.0/16"
  num_nat_gateways = 0
  vpc_name         = "foo"
}

module "eks" {
  source                       = "git@github.com:gruntwork-io/terraform-aws-eks.git//modules/eks-cluster-control-plane?ref=v0.47.2"
  cluster_name                 = "demo-20220127"
  endpoint_public_access_cidrs = ["0.0.0.0/0"]
  vpc_control_plane_subnet_ids = module.vpc.private_app_subnet_cidr_blocks
  vpc_id                       = module.vpc.vpc_id
}

module "rds" {
  source         = "git@github.com:gruntwork-io/terraform-aws-data-storage.git//modules/rds?ref=v0.22.4"
  engine         = "aurora-postgresql"
  engine_version = "11.9"
  instance_type  = "t3.large"
  name           = "demo-20220127"
  port           = 3306
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.public_subnet_ids
}
