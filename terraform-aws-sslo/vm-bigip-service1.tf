#
# Create Inspection Device 1 AZ1
#

## Create Management Network Interface for Inspection Device 1
resource "aws_network_interface" "inspection_device_1_mgmt_az1" {
  subnet_id         = aws_subnet.management_az1.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.management.id]
  tags = {
    Name = "${var.prefix}-eni_inspection_device_1_mgmt_az1"
  }
}

## Create dmz1 Network Interface for Inspection Device 1
resource "aws_network_interface" "inspection_device_1_dmz1_az1" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz1_az1"], 21)}"]
  subnet_id         = aws_subnet.dmz1_az1.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_inspection_device_1_dmz1_az1"
  }
}

## Create dmz2 Network Interface for Inspection Device 1
resource "aws_network_interface" "inspection_device_1_dmz2_az1" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz2_az1"], 21)}"]
  subnet_id         = aws_subnet.dmz2_az1.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_inspection_device_1_dmz2_az1"
  }
}

## Create Public IPs and associate to network interfaces
resource "aws_eip" "inspection_device_1_eip_az1" {
  vpc               = true
  public_ipv4_pool  = "amazon"
  network_interface = aws_network_interface.inspection_device_1_mgmt_az1.id
  tags = {
    Name = "${var.prefix}-eip_inspection_device_1_management_az1"
  }
}

## Inspection Device 1 
 resource "aws_instance" "inspection_device_1_az1" {
  depends_on        = [aws_eip.inspection_device_1_eip_az1, aws_route_table_association.management_az1]
  ami               = var.sslo_ami
  instance_type     = var.instance_type
  key_name          = aws_key_pair.my_keypair_az1.key_name
  availability_zone = var.az1
  user_data = file("f5_onboard_az1.sh")
  tags = {
    Name = "${var.prefix}-vm_inspection_device_1_az1"
  } 
  network_interface {
    network_interface_id = aws_network_interface.inspection_device_1_mgmt_az1.id
    device_index         = 0
  }
  network_interface {
    network_interface_id = aws_network_interface.inspection_device_1_dmz1_az1.id
    device_index         = 1
  }
  network_interface {
    network_interface_id = aws_network_interface.inspection_device_1_dmz2_az1.id
    device_index         = 2
  }
}



#
# Create Inspection Device 1 AZ2
#

## Create Management Network Interface for Inspection Device 1 AZ2
resource "aws_network_interface" "inspection_device_1_mgmt_az2" {
  subnet_id         = aws_subnet.management_az2.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.management.id]
  tags = {
    Name = "${var.prefix}-eni_inspection_device_1_mgmt_az2"
  }
}

## Create dmz1 Network Interface for Inspection Device 1
resource "aws_network_interface" "inspection_device_1_dmz1_az2" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz1_az2"], 21)}"]
  subnet_id         = aws_subnet.dmz1_az2.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_inspection_device_1_dmz1_az2"
  }
}

## Create dmz2 Network Interface for Inspection Device 1
resource "aws_network_interface" "inspection_device_1_dmz2_az2" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz2_az2"], 21)}"]
  subnet_id         = aws_subnet.dmz2_az2.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_inspection_device_1_dmz2_az2"
  }
}

## Create Public IPs and associate to network interfaces
resource "aws_eip" "inspection_device_1_management_az2" {
  vpc               = true
  public_ipv4_pool  = "amazon"
  network_interface = aws_network_interface.inspection_device_1_mgmt_az2.id
  tags = {
    Name = "${var.prefix}-eip_inspection_device_1_management_az2"
  }
}

## Inspection Device 1 AZ2
resource "aws_instance" "inspection_device_1_az2" {
  depends_on        = [aws_eip.inspection_device_1_management_az2, aws_route_table_association.management_az2]
  ami               = var.sslo_ami
  instance_type     = var.instance_type
  key_name          = aws_key_pair.my_keypair_az2.key_name
  availability_zone = var.az2
  user_data = file("f5_onboard_az2.sh")
  tags = {
    Name = "${var.prefix}-vm_inspection_device_1_az2"
  }  
  network_interface {
    network_interface_id = aws_network_interface.inspection_device_1_mgmt_az2.id
    device_index         = 0
  }
  network_interface {
    network_interface_id = aws_network_interface.inspection_device_1_dmz1_az2.id
    device_index         = 1
  }
  network_interface {
    network_interface_id = aws_network_interface.inspection_device_1_dmz2_az2.id
    device_index         = 2
  }
}
