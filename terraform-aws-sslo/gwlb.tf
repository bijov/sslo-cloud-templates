#Define a local variable with 2 values to add 2 BIGIP instances from AZ 1 & 2 in the target group
locals {
  bigip = {
    #"bigip_sslo_az1" = "${cidrhost(var.vpc_cidrs["external_az1"], 11)}"
    #"bigip_sslo_az2" = "${cidrhost(var.vpc_cidrs["external_az2"], 11)}"
    "bigip_sslo_az1" = "${aws_network_interface.bigip_external_az1.private_ip}"
    "bigip_sslo_az2" = "${aws_network_interface.bigip_external_az2.private_ip}"
  }
}

##################GWLB#################

resource "aws_lb" "sslo_gwlb" {
  internal           = false
  load_balancer_type = "gateway"
  subnets            = [aws_subnet.external_az1.id, aws_subnet.external_az2.id]

  tags = {
    Name = "${var.prefix}-gwlb"
    #Owner = var.resourceOwner
  }
}

resource "aws_lb_target_group" "sslo_tg" {
  name        = "${var.prefix}-tg"
  port        = 6081
  protocol    = "GENEVE"
  target_type = "ip"
  vpc_id      = aws_vpc.security_vpc.id

  health_check {
    protocol = "TCP"
    port     = 80
    #    matcher  = "200-399"
  }
}

resource "aws_lb_target_group_attachment" "sslo_tg_attachment" {
  for_each         = local.bigip
  target_group_arn = aws_lb_target_group.sslo_tg.arn
  target_id        = each.value
}


resource "aws_vpc_endpoint_service" "sslo_gwlb_eps" {
  acceptance_required        = false
  gateway_load_balancer_arns = [aws_lb.sslo_gwlb.arn]
  tags = {
    Name = "${var.prefix}-security_vpc_eps"
  }
}

resource "aws_lb_listener" "sslo_gwlb_listener" {
  load_balancer_arn = aws_lb.sslo_gwlb.id

  default_action {
    target_group_arn = aws_lb_target_group.sslo_tg.id
    type             = "forward"
  }
}

resource "aws_vpc_endpoint" "sslo_gwlb_ep_az1" {
  #count             = var.createGwlbEndpoint ? 1 : 0
  service_name      = aws_vpc_endpoint_service.sslo_gwlb_eps.service_name
  subnet_ids        = [aws_subnet.gwlbe_vpc2_az1.id]
  vpc_endpoint_type = "GatewayLoadBalancer"
  vpc_id            = aws_vpc.app_vpc.id
  tags = {
    Name = "${var.prefix}-ep_app_vpc_az1"
  }
}

resource "aws_vpc_endpoint" "sslo_gwlb_ep_az2" {
  #count             = var.createGwlbEndpoint ? 1 : 0
  service_name      = aws_vpc_endpoint_service.sslo_gwlb_eps.service_name
  subnet_ids        = [aws_subnet.gwlbe_vpc2_az2.id]
  vpc_endpoint_type = "GatewayLoadBalancer"
  vpc_id            = aws_vpc.app_vpc.id
  tags = {
    Name = "${var.prefix}-ep_app_vpc_az2"
  }
}