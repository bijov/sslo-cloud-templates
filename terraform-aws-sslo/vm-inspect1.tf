#
# Create Inspection Device 1
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


## Inspection Device 1 
resource "aws_instance" "inspection_device_1_az1" {
  #depends_on        = [aws_internet_gateway.sslo]
  ami               = var.inspection_ami
  instance_type     = "t2.small"
  key_name          = aws_key_pair.my_keypair_az1.key_name
  availability_zone = var.az1
  user_data         = <<-EOF
                      #!/usr/bin/bash
                      ip route delete default
                      ip route add default via ${cidrhost(var.vpc_cidrs["dmz1_az1"], 1)} metric 1
                      ip route add ${var.vpc_cidrs["external_az1"]} via ${cidrhost(var.vpc_cidrs["dmz2_az1"], 1)}
                      sysctl -w net.ipv4.ip_forward=1
                      EOF

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
