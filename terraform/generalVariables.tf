locals {
  stack_env = terraform.workspace

  vpc_name = lookup(
    var.vpc_name,
    terraform.workspace,
    var.vpc_name[var.default_value],
  )
  cidr_block_range = lookup(
    var.cidr_block_range,
    terraform.workspace,
    var.cidr_block_range[var.default_value],
  )
  public_subnet_1_cidr = lookup(
    var.public_subnet_1_cidr,
    terraform.workspace,
    var.public_subnet_1_cidr[var.default_value],
  )
  public_subnet_2_cidr = lookup(
    var.public_subnet_2_cidr,
    terraform.workspace,
    var.public_subnet_2_cidr[var.default_value],
  )
  private_subnet_1_cidr = lookup(
    var.private_subnet_1_cidr,
    terraform.workspace,
    var.private_subnet_1_cidr[var.default_value],
  )
  private_subnet_2_cidr = lookup(
    var.private_subnet_2_cidr,
    terraform.workspace,
    var.private_subnet_2_cidr[var.default_value],
  )
}

variable "vpc_name" {
  type = map(string)
  default = {
    default = "client-iac-vpc"
    preprod = "client-iac-pp-vpc"
    prod    = "client-iac-pd-vpc"
  }
}

variable "cidr_block_range" {
  type = map(string)
  default = {
    default = "10.0.0.0/16"
    preprod = "10.1.0.0/16"
    prod    = "10.2.0.0/16"
  }
}

variable "public_subnet_1_cidr" {
  type = map(string)
  default = {
    default = "10.0.101.0/24"
    preprod = "10.1.101.0/24"
    prod    = "10.2.101.0/24"
  }
}

variable "public_subnet_2_cidr" {
  type = map(string)
  default = {
    default = "10.0.102.0/24"
    preprod = "10.1.102.0/24"
    prod    = "10.2.102.0/24"
  }
}

variable "private_subnet_1_cidr" {
  type = map(string)
  default = {
    default = "10.0.1.0/24"
    preprod = "10.1.1.0/24"
    prod    = "10.2.1.0/24"
  }
}

variable "private_subnet_2_cidr" {
  type = map(string)
  default = {
    default = "10.0.2.0/24"
    preprod = "10.1.2.0/24"
    prod    = "10.2.2.0/24"
  }
}

variable "default_value" {
  description = "Will use this value as a default for all the resources."
  default     = "default"
}

