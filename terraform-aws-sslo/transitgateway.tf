## Create the TGW
#resource "aws_ec2_transit_gateway" "sslo" {
#  description = "Transit Gateway for SSLO"
#  tags = {
#    Name = "${var.prefix}-tgw_sslo"
#  }
#}


## Create the TGW Attachments
#resource "aws_ec2_transit_gateway_vpc_attachment" "security_vpc" {
#  subnet_ids             = [aws_subnet.internal_az1.id, aws_subnet.internal_az2.id]
#  transit_gateway_id     = aws_ec2_transit_gateway.sslo.id
#  vpc_id                 = aws_vpc.security_vpc.id
#  appliance_mode_support = "enable"
#  tags = {
#    Name = "${var.prefix}-tgw_attachment_security_vpc"
#  }
#}

#resource "aws_ec2_transit_gateway_vpc_attachment" "app_vpc" {
#  subnet_ids             = [aws_subnet.application_az1.id, aws_subnet.application_az2.id]
#  transit_gateway_id     = aws_ec2_transit_gateway.sslo.id
#  vpc_id                 = aws_vpc.app_vpc.id
#  appliance_mode_support = "enable"
#  tags = {
#    Name = "${var.prefix}-tgw_attachment_app_vpc"
#  }
#}


## Set static route pointing to the securitystack VPC 
#resource "aws_ec2_transit_gateway_route" "return_public_ip" {
#  destination_cidr_block         = "0.0.0.0/0"
#  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.security_vpc.id
#  transit_gateway_route_table_id = aws_ec2_transit_gateway.sslo.association_default_route_table_id
#}


## Create the TGW Route Table
#resource "aws_ec2_transit_gateway_route_table" "sslo" {
#  transit_gateway_id = aws_ec2_transit_gateway.sslo.id
#  tags = {
#    Name = "${var.prefix}-rt_tgw_sslo"
#  }
#}
