## Create the IGW
resource "aws_internet_gateway" "sslo_app_igw" {
  vpc_id = aws_vpc.app_vpc.id
  tags = {
    Name = "${var.prefix}-app_igw"
  }
}

resource "aws_internet_gateway" "sslo_security_igw" {
  vpc_id = aws_vpc.security_vpc.id
  tags = {
    Name = "${var.prefix}-security_igw"
  }
}

## Create the Route Table for 'management' and 'external' subnets
resource "aws_route_table" "app_internet" {
  vpc_id = aws_vpc.app_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sslo_app_igw.id
  }

  tags = {
    Name = "${var.prefix}-rt_app_internet"
  }
}

resource "aws_route_table" "security_internet" {
  vpc_id = aws_vpc.security_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sslo_security_igw.id
  }

  tags = {
    Name = "${var.prefix}-rt_security_internet"
  }
}
# Create the Main SSLO Security Stack Route Table association
#resource "aws_main_route_table_association" "main" {
#  vpc_id         = aws_vpc.securitystack.id
#  route_table_id = aws_route_table.internet.id
#}

## Create the Route Table Associations
resource "aws_route_table_association" "management_az1" {
  subnet_id      = aws_subnet.management_az1.id
  route_table_id = aws_route_table.security_internet.id
}

resource "aws_route_table_association" "management_az2" {
  subnet_id      = aws_subnet.management_az2.id
  route_table_id = aws_route_table.security_internet.id
}

#resource "aws_route_table_association" "external_az1" {
#  subnet_id      = aws_subnet.external_az1.id
#  route_table_id = aws_route_table.internet.id
#}

#resource "aws_route_table_association" "external_az2" {
#  subnet_id      = aws_subnet.external_az2.id
#  route_table_id = aws_route_table.internet.id
#}

resource "aws_route_table_association" "application_az1" {
  subnet_id      = aws_subnet.application_az1.id
  route_table_id = aws_route_table.app_internet.id
}

resource "aws_route_table_association" "application_az2" {
  subnet_id      = aws_subnet.application_az2.id
  route_table_id = aws_route_table.app_internet.id
}

resource "aws_route_table_association" "gwlbe_vpc2_az1" {
  subnet_id      = aws_subnet.gwlbe_vpc2_az1.id
  route_table_id = aws_route_table.app_internet.id
}

resource "aws_route_table_association" "gwlbe_vpc2_az2" {
  subnet_id      = aws_subnet.gwlbe_vpc2_az2.id
  route_table_id = aws_route_table.app_internet.id
}
## Create the Route Table for 'dmz1' subnet
resource "aws_route_table" "dmz1_az1" {
  vpc_id = aws_vpc.security_vpc.id
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_network_interface.bigip_dmz1_az1.id
  }
  route {
    cidr_block           = var.vpc_cidrs["external_az1"]
    network_interface_id = aws_network_interface.inspection_device_1_dmz1_az1.id
  }
  tags = {
    Name = "${var.prefix}-rt_inspection_device_1_dmz1_az1"
  }
}

resource "aws_route_table" "dmz1_az2" {
  vpc_id = aws_vpc.security_vpc.id
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_network_interface.bigip_dmz1_az2.id
  }
  route {
    cidr_block           = var.vpc_cidrs["external_az2"]
    network_interface_id = aws_network_interface.inspection_device_1_dmz1_az1.id
  }
  tags = {
    Name = "${var.prefix}-rt_inspection_device_1_dmz1_az1"
  }
}


## Create the Route Table Association
resource "aws_route_table_association" "dmz1_az1" {
  subnet_id      = aws_subnet.dmz1_az1.id
  route_table_id = aws_route_table.dmz1_az1.id
}

resource "aws_route_table_association" "dmz1_az2" {
  subnet_id      = aws_subnet.dmz1_az2.id
  route_table_id = aws_route_table.dmz1_az2.id
}

## Create the Route Table for 'dmz2' subnet
resource "aws_route_table" "dmz2_az1" {
  vpc_id = aws_vpc.security_vpc.id
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_network_interface.inspection_device_1_dmz2_az1.id
  }
  route {
    cidr_block           = var.vpc_cidrs["external_az1"]
    network_interface_id = aws_network_interface.bigip_dmz2_az1.id
  }
  tags = {
    Name = "${var.prefix}-rt_inspection_device_1_dmz2_az1"
  }
}

resource "aws_route_table" "dmz2_az2" {
  vpc_id = aws_vpc.security_vpc.id
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_network_interface.inspection_device_1_dmz2_az1.id
  }
  route {
    cidr_block           = var.vpc_cidrs["external_az2"]
    network_interface_id = aws_network_interface.bigip_dmz2_az2.id
  }
  tags = {
    Name = "${var.prefix}-rt_inspection_device_1_dmz2_az2"
  }
}

## Create the Route Table Association
resource "aws_route_table_association" "dmz2_az1" {
  subnet_id      = aws_subnet.dmz2_az1.id
  route_table_id = aws_route_table.dmz2_az1.id
}

resource "aws_route_table_association" "dmz2_az2" {
  subnet_id      = aws_subnet.dmz2_az2.id
  route_table_id = aws_route_table.dmz2_az2.id
}


## Create the Route Table for 'dmz3' subnet
resource "aws_route_table" "dmz3_az1" {
  vpc_id = aws_vpc.security_vpc.id
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_network_interface.bigip_dmz3_az1.id
  }
  route {
    cidr_block           = var.vpc_cidrs["external_az1"]
    network_interface_id = aws_network_interface.inspection_device_2_dmz3_az2.id
  }
  tags = {
    Name = "${var.prefix}-rt_inspection_device_2_dmz3_az1"
  }
}

resource "aws_route_table" "dmz3_az2" {
  vpc_id = aws_vpc.security_vpc.id
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_network_interface.bigip_dmz3_az2.id
  }
  route {
    cidr_block           = var.vpc_cidrs["external_az1"]
    network_interface_id = aws_network_interface.inspection_device_2_dmz3_az2.id
  }
  tags = {
    Name = "${var.prefix}-rt_inspection_device_2_dmz3_az2"
  }
}


## Create the Route Table Association
resource "aws_route_table_association" "dmz3_az1" {
  subnet_id      = aws_subnet.dmz3_az1.id
  route_table_id = aws_route_table.dmz3_az1.id
}

resource "aws_route_table_association" "dmz3_az2" {
  subnet_id      = aws_subnet.dmz3_az2.id
  route_table_id = aws_route_table.dmz3_az2.id
}

## Create the Route Table for 'dmz4' subnet
resource "aws_route_table" "dmz4_az1" {
  vpc_id = aws_vpc.security_vpc.id
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_network_interface.inspection_device_2_dmz4_az2.id
  }
  route {
    cidr_block           = var.vpc_cidrs["external_az1"]
    network_interface_id = aws_network_interface.bigip_dmz4_az1.id
  }
  tags = {
    Name = "${var.prefix}-rt_inspection_device_2_dmz4_az1"
  }
}

resource "aws_route_table" "dmz4_az2" {
  vpc_id = aws_vpc.security_vpc.id
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_network_interface.inspection_device_2_dmz4_az2.id
  }
  route {
    cidr_block           = var.vpc_cidrs["external_az1"]
    network_interface_id = aws_network_interface.bigip_dmz4_az2.id
  }
  tags = {
    Name = "${var.prefix}-rt_inspection_device_2_dmz4_az2"
  }
}

## Create the Route Table Association
resource "aws_route_table_association" "dmz4_az1" {
  subnet_id      = aws_subnet.dmz4_az1.id
  route_table_id = aws_route_table.dmz4_az1.id
}

resource "aws_route_table_association" "dmz4_az2" {
  subnet_id      = aws_subnet.dmz4_az2.id
  route_table_id = aws_route_table.dmz4_az2.id
}

## Create the Route Table for 'internal' subnet
#resource "aws_route_table" "internal_az1" {
#  vpc_id = aws_vpc.security_vpc.id
#  route {
#    cidr_block           = "0.0.0.0/0"
#    network_interface_id = aws_network_interface.bigip_internal_az1.id
#  }
#  route {
#    cidr_block         = var.vpc_cidrs["application_az1"]
#    vpc_endpoint_id    = aws_vpc_endpoint.sslo_gwlb_ep_az1.id
#    transit_gateway_id = aws_ec2_transit_gateway.sslo.id
#  }
#  tags = {
#    Name = "${var.prefix}-rt_internal_az1"
#  }
#}

#resource "aws_route_table" "internal_az2" {
#  vpc_id = aws_vpc.security_vpc.id
#  route {
#    cidr_block           = "0.0.0.0/0"
#    network_interface_id = aws_network_interface.bigip_internal_az2.id
#  }
#  route {
#    cidr_block         = var.vpc_cidrs["application_az2"]
#    vpc_endpoint_id    = aws_vpc_endpoint.sslo_gwlb_ep_az2.id
#    #transit_gateway_id = aws_ec2_transit_gateway.sslo.id
#  }
#  tags = {
#    Name = "${var.prefix}-rt_internal_az2"
#  }
#}


## Create the Route Table Association
#resource "aws_route_table_association" "internal_az1" {
#  subnet_id      = aws_subnet.internal_az1.id
#  route_table_id = aws_route_table.internal_az1.id
#}

#resource "aws_route_table_association" "internal_az2" {
#  subnet_id      = aws_subnet.internal_az2.id
#  route_table_id = aws_route_table.internal_az2.id
#}

## Create the Route Table for 'application' subnet
#resource "aws_route_table" "application_az1" {
#  vpc_id = aws_vpc.app_vpc.id
#  route {
#    cidr_block         = "0.0.0.0/0"
#    transit_gateway_id = aws_ec2_transit_gateway.sslo.id
#  }
#  tags = {
#    Name = "${var.prefix}-rt_application_az1"
#  }
#}

#resource "aws_route_table" "application_az2" {
#  vpc_id = aws_vpc.app_vpc.id
#  route {
#    cidr_block         = "0.0.0.0/0"
#    transit_gateway_id = aws_ec2_transit_gateway.sslo.id
#  }
#  tags = {
#    Name = "${var.prefix}-rt_application_az2"
#  }
#}

# Create the Main Route Table Association
#resource "aws_main_route_table_association" "application" {
#  vpc_id         = aws_vpc.appstack.id
#  route_table_id = aws_route_table.application.id
#}

## Create the Route Table Association for 'application' subnet
#resource "aws_route_table_association" "application_az1" {
#  subnet_id      = aws_subnet.application_az1.id
#  route_table_id = aws_route_table.application_az1.id
#}

#resource "aws_route_table_association" "application_az2" {
#  subnet_id      = aws_subnet.application_az2.id
#  route_table_id = aws_route_table.application_az2.id
#}
