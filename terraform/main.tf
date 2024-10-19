terraform {
  backend "s3" {
    bucket = "eks-terraform-ado"
    key    = "eks/azuredevops/terraform.tfstate"
    region = "eu-west-1"
  }
}

module "terraform-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.14.0"

  # VPC Basic details
  name                 = "terraform-default-module-vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = ["eu-west-1a, eu-west-1b"]
  private_subnets      = ["10.0.1.0/24, 10.0.2.0/24"]
  public_subnets       = ["10.0.101.0/24, 10.0.102.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
  public_subnet_tags = {
    Name = "pub-sub"
  }
  private_subnet_tags = {
    Name = "priv-sub"
  }
  # Database Details
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = ["10.0.151.0/24, 10.0.152.0/24"]
  database_subnet_tags = {
    Name = "db-sub"
  }
  tags = {
    Owner       = "Kunal"
    Environment = "dops"
  }
}