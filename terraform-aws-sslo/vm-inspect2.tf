#
# Create Inspection Device 2 AZ1
#

## Create Management Network Interface for Inspection Device 2 in AZ1
resource "aws_network_interface" "inspection_device_2_mgmt_az1" {
  subnet_id         = aws_subnet.management_az1.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.management.id]
  tags = {
    Name = "${var.prefix}-eni_inspection_device_2_mgmt_az1"
  }
}

## Create dmz3 Network Interface for Inspection Device 2
resource "aws_network_interface" "inspection_device_2_dmz3_az1" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz3_az1"], 21)}"]
  subnet_id         = aws_subnet.dmz3_az1.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_inspection_device_2_dmz3_az1"
  }
}

## Create dmz4 Network Interface for Inspection Device 2
resource "aws_network_interface" "inspection_device_2_dmz4_az1" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz4_az1"], 21)}"]
  subnet_id         = aws_subnet.dmz4_az1.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_inspection_device_2_dmz4_az1"
  }
}


## Inspection Device 2 AZ1
resource "aws_instance" "inspection_device_2_az1" {
  #depends_on        = [aws_internet_gateway.sslo]
  ami               = var.inspection_ami
  instance_type     = "t2.small"
  key_name          = aws_key_pair.my_keypair_az1.key_name
  availability_zone = var.az1
  user_data         = <<-EOF
                      #!/usr/bin/bash
                      ip route delete default
                      ip route add default via ${cidrhost(var.vpc_cidrs["dmz3_az1"], 1)} metric 1
                      ip route add ${var.vpc_cidrs["external_az1"]} via ${cidrhost(var.vpc_cidrs["dmz4_az1"], 1)}
                      sysctl -w net.ipv4.ip_forward=1
                      EOF

  tags = {
    Name = "${var.prefix}-vm_inspection_device_2_az1"
  }
  network_interface {
    network_interface_id = aws_network_interface.inspection_device_2_mgmt_az1.id
    device_index         = 0
  }
  network_interface {
    network_interface_id = aws_network_interface.inspection_device_2_dmz3_az1.id
    device_index         = 1
  }
  network_interface {
    network_interface_id = aws_network_interface.inspection_device_2_dmz4_az1.id
    device_index         = 2
  }
}


#
# Create Inspection Device 2 AZ2
#

## Create Management Network Interface for Inspection Device 2 in AZ2
resource "aws_network_interface" "inspection_device_2_mgmt_az2" {
  subnet_id         = aws_subnet.management_az2.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.management.id]
  tags = {
    Name = "${var.prefix}-eni_inspection_device_2_mgmt_az2"
  }
}

## Create dmz3 Network Interface for Inspection Device 2
resource "aws_network_interface" "inspection_device_2_dmz3_az2" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz3_az2"], 21)}"]
  subnet_id         = aws_subnet.dmz3_az2.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_inspection_device_2_dmz3_az2"
  }
}

## Create dmz4 Network Interface for Inspection Device 2
resource "aws_network_interface" "inspection_device_2_dmz4_az2" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz4_az2"], 21)}"]
  subnet_id         = aws_subnet.dmz4_az2.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_inspection_device_2_dmz4_az2"
  }
}


## Inspection Device 2 AZ1
resource "aws_instance" "inspection_device_2_az2" {
  #depends_on        = [aws_internet_gateway.sslo]
  ami               = var.inspection_ami
  instance_type     = "t2.small"
  key_name          = aws_key_pair.my_keypair_az2.key_name
  availability_zone = var.az2
  user_data         = <<-EOF
                      #!/usr/bin/bash
                      ip route delete default
                      ip route add default via ${cidrhost(var.vpc_cidrs["dmz3_az2"], 1)} metric 1
                      ip route add ${var.vpc_cidrs["external_az2"]} via ${cidrhost(var.vpc_cidrs["dmz4_az2"], 1)}
                      sysctl -w net.ipv4.ip_forward=1
                      EOF

  tags = {
    Name = "${var.prefix}-vm_inspection_device_2_az2"
  }
  network_interface {
    network_interface_id = aws_network_interface.inspection_device_2_mgmt_az2.id
    device_index         = 0
  }
  network_interface {
    network_interface_id = aws_network_interface.inspection_device_2_dmz3_az2.id
    device_index         = 1
  }
  network_interface {
    network_interface_id = aws_network_interface.inspection_device_2_dmz4_az2.id
    device_index         = 2
  }
}

