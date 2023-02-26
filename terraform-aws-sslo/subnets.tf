## Create Management Subnets 
resource "aws_subnet" "management_az1" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = var.vpc_cidrs["management_az1"]
  availability_zone = var.az1
  tags = {
    Name       = "${var.prefix}-subnet_management_az1"
    Group_Name = "${var.prefix}-subnet_management_az1"
  }
}

resource "aws_subnet" "management_az2" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = var.vpc_cidrs["management_az2"]
  availability_zone = var.az2
  tags = {
    Name       = "${var.prefix}-subnet_management_az2"
    Group_Name = "${var.prefix}-subnet_management_az2"
  }
}

## Create External Subnets
resource "aws_subnet" "external_az1" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = var.vpc_cidrs["external_az1"]
  availability_zone = var.az1
  tags = {
    Name       = "${var.prefix}-subnet_external_az1"
    Group_Name = "${var.prefix}-subnet_external_az1"
  }
}

resource "aws_subnet" "external_az2" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = var.vpc_cidrs["external_az2"]
  availability_zone = var.az2
  tags = {
    Name       = "${var.prefix}-subnet_external_az2"
    Group_Name = "${var.prefix}-subnet_external_az2"
  }
}

##Create GWLB Endpoint Subnets

resource "aws_subnet" "gwlbe_vpc2_az1" {
  vpc_id            = aws_vpc.app_vpc.id
  cidr_block        = var.vpc_cidrs["gwlbe_vpc2_az1"]
  availability_zone = var.az1
  tags = {
    Name       = "${var.prefix}-subnet_gwlbe_vpc2_az1"
    Group_Name = "${var.prefix}-subnet_gwlbe_vpc2_az1"
  }
}

resource "aws_subnet" "gwlbe_vpc2_az2" {
  vpc_id            = aws_vpc.app_vpc.id
  cidr_block        = var.vpc_cidrs["gwlbe_vpc2_az2"]
  availability_zone = var.az2
  tags = {
    Name       = "${var.prefix}-subnet_gwlbe_vpc2_az2"
    Group_Name = "${var.prefix}-subnet_gwlbe_vpc2_az2"
  }
}

## Create dmz1 Subnets
resource "aws_subnet" "dmz1_az1" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = var.vpc_cidrs["dmz1_az1"]
  availability_zone = var.az1
  tags = {
    Name       = "${var.prefix}-subnet_dmz1_az1"
    Group_Name = "${var.prefix}-subnet_dmz1_az1"
  }
}

resource "aws_subnet" "dmz1_az2" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = var.vpc_cidrs["dmz1_az2"]
  availability_zone = var.az2
  tags = {
    Name       = "${var.prefix}-subnet_dmz1_az2"
    Group_Name = "${var.prefix}-subnet_dmz1_az2"
  }
}

## Create dmz2 Subnets
resource "aws_subnet" "dmz2_az1" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = var.vpc_cidrs["dmz2_az1"]
  availability_zone = var.az1
  tags = {
    Name       = "${var.prefix}-subnet_dmz2_az1"
    Group_Name = "${var.prefix}-subnet_dmz2_az1"
  }
}

resource "aws_subnet" "dmz2_az2" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = var.vpc_cidrs["dmz2_az2"]
  availability_zone = var.az2
  tags = {
    Name       = "${var.prefix}-subnet_dmz2_az2"
    Group_Name = "${var.prefix}-subnet_dmz2_az2"
  }
}

## Create dmz3 Subnet
resource "aws_subnet" "dmz3_az1" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = var.vpc_cidrs["dmz3_az1"]
  availability_zone = var.az1
  tags = {
    Name       = "${var.prefix}-subnet_dmz3_az1"
    Group_Name = "${var.prefix}-subnet_dmz3_az1"
  }
}

resource "aws_subnet" "dmz3_az2" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = var.vpc_cidrs["dmz3_az2"]
  availability_zone = var.az2
  tags = {
    Name       = "${var.prefix}-subnet_dmz3_az2"
    Group_Name = "${var.prefix}-subnet_dmz3_az2"
  }
}
## Create dmz4 Subnet
resource "aws_subnet" "dmz4_az1" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = var.vpc_cidrs["dmz4_az1"]
  availability_zone = var.az1
  tags = {
    Name       = "${var.prefix}-subnet_dmz4_az1"
    Group_Name = "${var.prefix}-subnet_dmz4_az1"
  }
}

resource "aws_subnet" "dmz4_az2" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = var.vpc_cidrs["dmz4_az2"]
  availability_zone = var.az2
  tags = {
    Name       = "${var.prefix}-subnet_dmz4_az2"
    Group_Name = "${var.prefix}-subnet_dmz4_az2"
  }
}


## Create Application Subnet
resource "aws_subnet" "application_az1" {
  vpc_id            = aws_vpc.app_vpc.id
  cidr_block        = var.vpc_cidrs["application_az1"]
  availability_zone = var.az1
  tags = {
    Name       = "${var.prefix}-subnet_application_az1"
    Group_Name = "${var.prefix}-subnet_application_az1"
  }
}

resource "aws_subnet" "application_az2" {
  vpc_id            = aws_vpc.app_vpc.id
  cidr_block        = var.vpc_cidrs["application_az2"]
  availability_zone = var.az2
  tags = {
    Name       = "${var.prefix}-subnet_application_az2"
    Group_Name = "${var.prefix}-subnet_application_az2"
  }
}
