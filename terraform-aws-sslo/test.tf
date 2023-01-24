resource "aws_vpc" "appstack" {
  cidr_block           = var.vpc_cidrs["application"]
  enable_dns_hostnames = "true"
  tags = {
    Name = "${var.prefix}-sslo-appstack"
  }
}