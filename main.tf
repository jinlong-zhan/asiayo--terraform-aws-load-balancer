provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./vpc"
}

module "security_group" {
  source = "./security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source          = "./ec2"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.public_subnets
  security_group  = module.security_group.security_group_id
}

module "alb" {
  source          = "./alb"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.public_subnets
  security_group  = module.security_group.security_group_id
  target_instances = module.ec2.instance_ids
}

