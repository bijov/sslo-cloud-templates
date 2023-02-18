## Create the Network Interface for the WebServer
resource "aws_network_interface" "webapp1_az1" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["application_az1"], 200)}"]
  subnet_id         = aws_subnet.application_az1.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.appstack.id]
  tags = {
    Name = "${var.prefix}-eni_webapp1_az1"
  }
}

resource "aws_network_interface" "webapp1_az2" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["application_az2"], 200)}"]
  subnet_id         = aws_subnet.application_az2.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.appstack.id]
  tags = {
    Name = "${var.prefix}-eni_webapp1_az2"
  }
}

## Create Test WebApp Server

resource "aws_instance" "webapp1-server-az1" {
  #depends_on        = [aws_internet_gateway.sslo]
  ami               = var.webapp_ami
  instance_type     = "t3.small"
  key_name          = aws_key_pair.my_keypair_az1.key_name
  availability_zone = var.az1
  tags = {
    Name = "${var.prefix}-vm_webapp1_az1"
  }
  network_interface {
    network_interface_id = aws_network_interface.webapp1_az1.id
    device_index         = 0
  }
}

resource "aws_instance" "webapp1-server-az2" {
  #depends_on        = [aws_internet_gateway.sslo]
  ami               = var.webapp_ami
  instance_type     = "t3.small"
  key_name          = aws_key_pair.my_keypair_az2.key_name
  availability_zone = var.az2
  tags = {
    Name = "${var.prefix}-vm_webapp1_az2"
  }
  network_interface {
    network_interface_id = aws_network_interface.webapp1_az2.id
    device_index         = 0
  }
}


resource "aws_eip" "webapp1_az1" {
  vpc               = true
  public_ipv4_pool  = "amazon"
  network_interface = aws_network_interface.webapp1_az1.id
  tags = {
    Name = "${var.prefix}-eip_webapp1_az1"
  }
}
resource "aws_eip" "webapp1_az2" {
  vpc               = true
  public_ipv4_pool  = "amazon"
  network_interface = aws_network_interface.webapp1_az2.id
  tags = {
    Name = "${var.prefix}-eip_webapp1_az2"
  }
}

