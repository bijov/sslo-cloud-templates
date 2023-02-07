resource "tls_private_key" "my_keypair_az1" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_private_key" "my_keypair_az2" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "my_keypair_az1" {
  key_name   = var.ec2_key_name_az1
  public_key = tls_private_key.my_keypair_az1.public_key_openssh
}

resource "aws_key_pair" "my_keypair_az2" {
  key_name   = var.ec2_key_name_az2
  public_key = tls_private_key.my_keypair_az2.public_key_openssh
}

resource "local_file" "private_key_az1" {
  content         = tls_private_key.my_keypair_az1.private_key_pem
  filename        = "${var.ec2_key_name_az1}.key"
  file_permission = "0600"
}

resource "local_file" "private_key_az2" {
  content         = tls_private_key.my_keypair_az2.private_key_pem
  filename        = "${var.ec2_key_name_az2}.key"
  file_permission = "0600"
}

resource "local_file" "public_key_az1" {
  content         = tls_private_key.my_keypair_az1.public_key_openssh
  filename        = "${var.ec2_key_name_az1}.pub"
  file_permission = "0600"
}

resource "local_file" "public_key_az2" {
  content         = tls_private_key.my_keypair_az2.public_key_openssh
  filename        = "${var.ec2_key_name_az2}.pub"
  file_permission = "0600"
}
