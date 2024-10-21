variable "region" {
  type    = string
  default = "eu-west-1"
}
variable "vpc_name" {}
variable "stack_env" {}
variable "cidr_block_range" {}
variable "public_subnet_1_cidr" {}
variable "public_subnet_2_cidr" {}
variable "private_subnet_1_cidr" {}
variable "private_subnet_2_cidr" {}