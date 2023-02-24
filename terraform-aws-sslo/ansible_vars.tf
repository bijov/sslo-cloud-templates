resource "local_file" "ansible_vars" {
  content  = <<-DOC
     ansible_host_f51: ${aws_instance.sslo_az1.public_ip}
     ansible_host_f52: ${aws_instance.sslo_az2.public_ip}
     ansible_httpapi_password: "${var.admin_password}"
     snort1_host: ${aws_network_interface.inspection_device_1_dmz1_az1.private_ip}
     snort2_host: ${aws_network_interface.inspection_device_2_dmz3_az2.private_ip}
     webapp1_az1_host: ${aws_instance.webapp1-server-az1.private_ip}
     webapp1_az2_host: ${aws_instance.webapp1-server-az2.private_ip}
     #sslo_app1_az1: ${aws_eip.webapp1_az1.private_ip}
     #sslo_app1_az2: ${aws_eip.webapp1_az2.private_ip}
     
     DOC
  filename = "./ansible_vars.yaml"
}
