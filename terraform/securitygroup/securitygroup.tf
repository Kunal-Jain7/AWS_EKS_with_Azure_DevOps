resource "aws_security_group" "terraform-eks-bastion" {
  vpc_id      = var.vpc_id
  name        = format("%s-terraform-eks-bastionhost", var.stack_env)
  description = "Security Group for Terraform EKS Bastion Host Opening 80, 22, 443"

  tags = {
    Name = format("%s-terraform-eks-bastionhost", var.stack_env)
  }

  ingress {
    description = "Allow remote access anywhere"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  ingress {
    description = "Allow HTTP Traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS Teaffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allowing outboud rule for ALL"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}