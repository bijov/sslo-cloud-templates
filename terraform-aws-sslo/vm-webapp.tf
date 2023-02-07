## Create the Network Interface for the WebServer
resource "aws_network_interface" "webapp_az1" {
  private_ips       = ["${cidrhost(var.vpc_cidrs["application_az1"], 200)}"]
  subnet_id         = aws_subnet.application_az1.id
  source_dest_check = "false"
  security_groups   = [aws_security_group.appstack.id]
  tags = {
    Name = "${var.prefix}-eni_webapp_az1"
  }
}

## Create Test WebApp Server

resource "aws_instance" "webapp-server-az1" {
  #depends_on        = [aws_internet_gateway.sslo]
  ami               = var.webapp_ami
  instance_type     = "t3.small"
  key_name          = aws_key_pair.my_keypair_az1.key_name
  availability_zone = var.az1
  tags = {
    Name = "${var.prefix}-vm_webapp_az1"
  }
  network_interface {
    network_interface_id = aws_network_interface.webapp_az1.id
    device_index         = 0
  }
}
