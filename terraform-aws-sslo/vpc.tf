## Create the VPCs for both stacks

resource "aws_vpc" "security_vpc" {
  cidr_block           = var.vpc_cidrs["vpc1"]
  enable_dns_hostnames = "true"
  tags = {
    Name = "${var.prefix}_security_vpc"
  }
}

resource "aws_vpc" "app_vpc" {
  cidr_block           = var.vpc_cidrs["vpc2"]
  enable_dns_hostnames = "true"
  tags = {
    Name = "${var.prefix}_app_vpc"
  }
}
