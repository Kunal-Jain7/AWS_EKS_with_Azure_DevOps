terraform {
  backend "s3" {
    bucket = "eks-terraform-ado"
    key    = "eks/azuredevops/terraform.tfstate"
    region = "eu-west-1"
  }
}

module "vpc" {
  source = "./networking"

  stack_env             = local.stack_env
  vpc_name              = local.vpc_name
  cidr_block_range      = local.cidr_block_range
  public_subnet_1_cidr  = local.public_subnet_1_cidr
  public_subnet_2_cidr  = local.public_subnet_2_cidr
  private_subnet_1_cidr = local.private_subnet_1_cidr
  private_subnet_2_cidr = local.private_subnet_2_cidr
}