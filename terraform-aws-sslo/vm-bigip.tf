#
# Deploy BIG-IP VM
#

## Create network interfaces

## Create Management Network Interface for BIG-IP
resource "aws_network_interface" "bigip_management_az1" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["management_az1"], 11)}"]
  subnet_id         = aws_subnet.management_az1.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.management.id]
  tags = {
    Name = "${var.prefix}-eni_bigip_management_az1"
  }
}

resource "aws_network_interface" "bigip_management_az2" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["management_az2"], 11)}"]
  subnet_id         = aws_subnet.management_az2.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.management.id]
  tags = {
    Name = "${var.prefix}-eni_bigip_management_az2"
  }
}


## Create External Network Interface for BIG-IP 
resource "aws_network_interface" "bigip_external_az1" {
  #private_ips       = ["${cidrhost(var.vpc_cidrs["external_az1"], 11)}", "${var.app_vip_az1}"]
  private_ips       = ["${cidrhost(var.vpc_cidrs["external_az1"], 11)}"]
  subnet_id         = aws_subnet.external_az1.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.external.id]
  tags = {
    Name = "${var.prefix}-eni_bigip_external_az1"
  }
}

resource "aws_network_interface" "bigip_external_az2" {
  #private_ips       = ["${cidrhost(var.vpc_cidrs["external_az2"], 11)}", "${var.app_vip_az2}"]
  private_ips       = ["${cidrhost(var.vpc_cidrs["external_az2"], 11)}"]
  subnet_id         = aws_subnet.external_az2.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.external.id]
  tags = {
    Name = "${var.prefix}-eni_bigip_external_az2"
  }
}


## Create Internal Network Interface for BIG-IP
#resource "aws_network_interface" "bigip_internal_az1" {
#  private_ips       = ["${cidrhost(var.vpc_cidrs["internal_az1"], 11)}"]
#  subnet_id         = aws_subnet.internal_az1.id
#  source_dest_check = "false"
#  security_groups   = [aws_security_group.internal.id]
#  tags = {
#    Name = "${var.prefix}-eni_bigip_internal_az1"
#  }
#}

#resource "aws_network_interface" "bigip_internal_az2" {
#  private_ips       = ["${cidrhost(var.vpc_cidrs["internal_az2"], 11)}"]
#  subnet_id         = aws_subnet.internal_az2.id
#  source_dest_check = "false"
#  security_groups   = [aws_security_group.internal.id]
#  tags = {
#    Name = "${var.prefix}-eni_bigip_internal_az2"
#  }
#}

## Create dmz1 Network Interface for BIG-IP
resource "aws_network_interface" "bigip_dmz1_az1" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz1_az1"], 7)}", "${cidrhost(var.vpc_cidrs["dmz1_az1"], 8)}"]
  subnet_id         = aws_subnet.dmz1_az1.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_bigip_dmz1_az1"
  }
}

resource "aws_network_interface" "bigip_dmz1_az2" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz1_az2"], 7)}", "${cidrhost(var.vpc_cidrs["dmz1_az2"], 8)}"]
  subnet_id         = aws_subnet.dmz1_az2.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_bigip_dmz1_az2"
  }
}

## Create dmz2 Network Interface for BIG-IP
resource "aws_network_interface" "bigip_dmz2_az1" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz2_az1"], 117)}", "${cidrhost(var.vpc_cidrs["dmz2_az1"], 116)}"]
  subnet_id         = aws_subnet.dmz2_az1.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_bigip_dmz2_az1"
  }
}

resource "aws_network_interface" "bigip_dmz2_az2" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz2_az2"], 117)}", "${cidrhost(var.vpc_cidrs["dmz2_az2"], 116)}"]
  subnet_id         = aws_subnet.dmz2_az2.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_bigip_dmz2_az2"
  }
}

## Create dmz3 Network Interface for BIG-IP
resource "aws_network_interface" "bigip_dmz3_az1" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz3_az1"], 7)}", "${cidrhost(var.vpc_cidrs["dmz3_az1"], 8)}"]
  subnet_id         = aws_subnet.dmz3_az1.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_bigip_dmz3_az1"
  }
}

resource "aws_network_interface" "bigip_dmz3_az2" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz3_az2"], 7)}", "${cidrhost(var.vpc_cidrs["dmz3_az2"], 8)}"]
  subnet_id         = aws_subnet.dmz3_az2.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_bigip_dmz3_az2"
  }
}

## Create dmz4 Network Interface for BIG-IP
resource "aws_network_interface" "bigip_dmz4_az1" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz4_az1"], 117)}", "${cidrhost(var.vpc_cidrs["dmz4_az1"], 116)}"]
  subnet_id         = aws_subnet.dmz4_az1.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_bigip_dmz4_az1"
  }
}

resource "aws_network_interface" "bigip_dmz4_az2" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["dmz4_az2"], 117)}", "${cidrhost(var.vpc_cidrs["dmz4_az2"], 116)}"]
  subnet_id         = aws_subnet.dmz4_az2.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.inspection_zone.id]
  tags = {
    Name = "${var.prefix}-eni_bigip_dmz4_az2"
  }
}

## Create geneve Network Interface for BIG-IP
resource "aws_network_interface" "bigip_geneve_az1" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["gwlbe_vpc1_az1"], 117)}", "${cidrhost(var.vpc_cidrs["gwlbe_vpc1_az1"], 116)}"]
  subnet_id         = aws_subnet.gwlbe_vpc1_az1.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.external.id]
  tags = {
    Name = "${var.prefix}-eni_bigip_geneve_az1"
  }
}

resource "aws_network_interface" "bigip_geneve_az2" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["gwlbe_vpc1_az2"], 117)}", "${cidrhost(var.vpc_cidrs["gwlbe_vpc1_az2"], 116)}"]
  subnet_id         = aws_subnet.gwlbe_vpc1_az2.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.external.id]
  tags = {
    Name = "${var.prefix}-eni_bigip_geneve_az2"
  }
}


## Create Public IPs and associate to network interfaces
resource "aws_eip" "bigip_management_az1" {
  vpc               = true
  public_ipv4_pool  = "amazon"
  network_interface = aws_network_interface.bigip_management_az1.id
  tags = {
    Name = "${var.prefix}-eip_bigip_management_az1"
  }
}
resource "aws_eip" "bigip_management_az2" {
  vpc               = true
  public_ipv4_pool  = "amazon"
  network_interface = aws_network_interface.bigip_management_az2.id
  tags = {
    Name = "${var.prefix}-eip_bigip_management_az2"
  }
}

#
# BIG-IP
#

## Generate cloud-init script for BIG-IP
#data "template_file" "f5_onboard" {
#  template = file("${path.module}/f5_onboard.tmpl")
#  vars = {
#    license_key     = var.license_key
#    admin_password  = var.admin_password
#    internal_selfip = "${cidrhost(var.vpc_cidrs["internal"], 11)}/24"
#    external_selfip = "${cidrhost(var.vpc_cidrs["external"], 11)}/24"
#    app_route_dest  = var.vpc_cidrs["application"]
#    app_route_gw    = "${cidrhost(var.vpc_cidrs["internal"], 1)}"
#    sslo_pkg_name   = var.sslo_pkg_name
#  }
#}

## Create BIG-IP-AZ1
resource "aws_instance" "sslo_az1" {
  depends_on        = [aws_eip.bigip_management_az1, aws_route_table_association.management_az1]
  ami               = var.sslo_ami
  instance_type     = var.instance_type
  key_name          = aws_key_pair.my_keypair_az1.key_name
  availability_zone = var.az1
  user_data = file("f5_onboard_az1.sh")
  tags = {
    Name = "${var.prefix}-vm_bigip_sslo_az1"
  }
  # set the mgmt interface 
  network_interface {
    network_interface_id = aws_network_interface.bigip_management_az1.id
    device_index         = 0
  }
  # set the external interface 
  network_interface {
    network_interface_id = aws_network_interface.bigip_external_az1.id
    device_index         = 1
  }
  # set the internal interface 
  #network_interface {
  #  network_interface_id = aws_network_interface.bigip_internal_az1.id
  #  device_index         = 2
  #}

  # set the inspection zone (dmz1) interface 
  network_interface {
    network_interface_id = aws_network_interface.bigip_dmz1_az1.id
    device_index         = 3
  }
  # set the inspection zone (dmz2) interface 
  network_interface {
    network_interface_id = aws_network_interface.bigip_dmz2_az1.id
    device_index         = 4
  }
  # set the inspection zone (dmz3) interface 
  network_interface {
    network_interface_id = aws_network_interface.bigip_dmz3_az1.id
    device_index         = 5
  }
  # set the inspection zone (dmz4) interface 
  network_interface {
    network_interface_id = aws_network_interface.bigip_dmz4_az1.id
    device_index         = 6
  }
  # set the geneve zone (geneve) interface 
  network_interface {
    network_interface_id = aws_network_interface.bigip_geneve_az1.id
    device_index         = 7
  }
}

## Create BIG-IP-AZ2
resource "aws_instance" "sslo_az2" {
  depends_on        = [aws_eip.bigip_management_az2, aws_route_table_association.management_az2]
  ami               = var.sslo_ami
  instance_type     = var.instance_type
  key_name          = aws_key_pair.my_keypair_az2.key_name
  availability_zone = var.az2
  user_data = file("f5_onboard_az2.sh")
  tags = {
    Name = "${var.prefix}-vm_bigip_sslo_az2"
  }
  # set the mgmt interface 
  network_interface {
    network_interface_id = aws_network_interface.bigip_management_az2.id
    device_index         = 0
  }
  # set the external interface 
  network_interface {
    network_interface_id = aws_network_interface.bigip_external_az2.id
    device_index         = 1
  }
  # set the internal interface 
  #network_interface {
  #  network_interface_id = aws_network_interface.bigip_internal_az2.id
  #  device_index         = 2
  #}

  # set the inspection zone (dmz1) interface 
  network_interface {
    network_interface_id = aws_network_interface.bigip_dmz1_az2.id
    device_index         = 3
  }
  # set the inspection zone (dmz2) interface 
  network_interface {
    network_interface_id = aws_network_interface.bigip_dmz2_az2.id
    device_index         = 4
  }
  # set the inspection zone (dmz3) interface 
  network_interface {
    network_interface_id = aws_network_interface.bigip_dmz3_az2.id
    device_index         = 5
  }
  # set the inspection zone (dmz4) interface 
  network_interface {
    network_interface_id = aws_network_interface.bigip_dmz4_az2.id
    device_index         = 6
  }

  # set the geneve zone (geneve) interface 
  network_interface {
    network_interface_id = aws_network_interface.bigip_geneve_az2.id
    device_index         = 7
}
}