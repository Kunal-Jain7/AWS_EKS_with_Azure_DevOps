resource "aws_vpc" "client-vpc" {
  cidr_block           = var.cidr_block_range
  enable_dns_hostnames = true

  tags = {
    Name = format("%s-%s", var.vpc_name, var.stack_env)
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id            = aws_vpc.client-vpc.id
  cidr_block        = var.public_subnet_1_cidr
  availability_zone = "eu-west-1a"

  tags = {
    Name = format("%s-pubsub1", var.stack_env)
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id            = aws_vpc.client-vpc.id
  cidr_block        = var.public_subnet_2_cidr
  availability_zone = "eu-west-1b"

  tags = {
    Name = format("%s-pubsub2", var.stack_env)
  }
}

resource "aws_subnet" "private_subnet_1_cidr" {
  vpc_id            = aws_vpc.client-vpc.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = "eu-west-1a"

  tags = {
    Name = format("%s-privsub1", var.stack_env)
  }
}

resource "aws_subnet" "private_subnet_2_cidr" {
  vpc_id            = aws_vpc.client-vpc.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = "eu-west-1b"

  tags = {
    Name = format("%s-privsub2", var.stack_env)
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.client-vpc.id

  tags = {
    Name = format("%s-public-rt", var.stack_env)
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.client-vpc.id

  tags = {
    Name = format("%s-private-rt", var.stack_env)
  }
}

resource "aws_route_table_association" "public-rta-1" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id      = aws_subnet.public-subnet-1.id
}

resource "aws_route_table_association" "public-rta-2" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id      = aws_subnet.public-subnet-2.id
}

resource "aws_route_table_association" "private-rta-1" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id      = aws_subnet.private_subnet_1_cidr.id
}

resource "aws_route_table_association" "private-rta-2" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id      = aws_subnet.private_subnet_2_cidr.id
}

resource "aws_internet_gateway" "client-igw" {
  vpc_id = aws_vpc.client-vpc.id
  tags = {
    Name = format("%s-igw", var.stack_env)
  }
}