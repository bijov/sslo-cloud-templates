resource "local_file" "ansible_vars" {
  content  = <<-DOC
     ansible_host: ${aws_instance.sslo_az1.public_ip}
     ansible_httpapi_password: "${var.admin_password}"
     snort1_host: ${aws_network_interface.inspection_device_1_dmz1_az1.private_ip}
     snort2_host: ${aws_network_interface.inspection_device_2_dmz3_az2.private_ip}
     webapp_pool: ${aws_instance.webapp-server-az1.private_ip}
     sslo_vip_az1: ${aws_eip.sslo_vip_az1.private_ip}
     
     DOC
  filename = "./ansible_vars.yaml"
}
