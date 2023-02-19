#output "sslo_internal_az1" {
#  value       = aws_network_interface.bigip_internal_az1.private_ip
#  description = "The private IP address of az1 SSLO internal interface."
#}

#output "sslo_internal_az2" {
#  value       = aws_network_interface.bigip_internal_az2.private_ip
#  description = "The private IP address of az2 SSLO internal interface."
#}

output "sslo_external_az1" {
  value       = aws_network_interface.bigip_external_az1.private_ips
  description = "The private IP address of az1 SSLO external interface for GENEVE tunnel endpoint."
}

output "sslo_external_az2" {
  value       = aws_network_interface.bigip_external_az2.private_ips
  description = "The private IP address of az2 SSLO external interface for GENEVE tunnel endpoint."
}

output "sslo_dmz1_az1" {
  value       = aws_network_interface.bigip_dmz1_az1.private_ips
  description = "The private IP address of az1 SSLO dmz1 interface."
}

output "sslo_dmz1_az2" {
  value       = aws_network_interface.bigip_dmz1_az2.private_ips
  description = "The private IP address of az2 SSLO dmz1 interface."
}

output "sslo_dmz2_az1" {
  value       = aws_network_interface.bigip_dmz2_az1.private_ips
  description = "The private IP address of az1 SSLO dmz2 interface."
}

output "sslo_dmz2_az2" {
  value       = aws_network_interface.bigip_dmz2_az2.private_ips
  description = "The private IP address of az2 SSLO dmz2 interface."
}

output "sslo_dmz3_az1" {
  value       = aws_network_interface.bigip_dmz3_az1.private_ips
  description = "The private IP address of az1 SSLO dmz3 interface."
}

output "sslo_dmz3_az2" {
  value       = aws_network_interface.bigip_dmz3_az2.private_ips
  description = "The private IP address of az2 SSLO dmz3 interface."
}

output "sslo_dmz4_az1" {
  value       = aws_network_interface.bigip_dmz4_az1.private_ips
  description = "The private IP address of az1 SSLO dmz4 interface."
}

output "sslo_dmz4_az2" {
  value       = aws_network_interface.bigip_dmz4_az2.private_ips
  description = "The private IP address of az2 SSLO dmz4 interface."
}

output "sslo_management_az1" {
  value       = aws_network_interface.bigip_management_az1.private_ip
  description = "The private IP address of az1 SSLO management interface."
}

output "sslo_management_az2" {
  value       = aws_network_interface.bigip_management_az2.private_ip
  description = "The private IP address of az2 SSLO management interface."
}


output "sslo_management_public_ip_az1" {
  value       = aws_instance.sslo_az1.public_ip
  description = "The public IP address of az1 SSLO management interface."
}

output "sslo_management_public_ip_az2" {
  value       = aws_instance.sslo_az2.public_ip
  description = "The public IP address of az2 SSLO management interface."
}

output "sslo_management_public_dns_az1" {
  value       = aws_instance.sslo_az1.public_dns
  description = "The public DNS of az1 SSLO."
}

output "sslo_management_public_dns_az2" {
  value       = aws_instance.sslo_az2.public_dns
  description = "The public DNS of az2 SSLO."
}

output "sslo_app1_az1" {
  value       = aws_eip.webapp1_az1.public_ip
  description = "The public IP of the az1 VIP"
}

output "sslo_app1_az2" {
  value       = aws_eip.webapp1_az2.public_ip
  description = "The public IP of the az2 VIP"
}

output "webapp1_internal" {
  value       = aws_instance.webapp1-server-az1.private_ip
  description = "Private IP of the web app server"
}

output "webapp2_internal" {
  value       = aws_instance.webapp1-server-az2.private_ip
  description = "Private IP of the web app server"
}

output "inspection_service_ip_1" {
  value       = aws_network_interface.inspection_device_1_dmz1_az1.private_ip
  description = "Private IP of the Inspection Service One IP"
}

output "inspection_service_ip_2" {
  value       = aws_network_interface.inspection_device_2_dmz3_az2.private_ip
  description = "Private IP of the Inspection Service Two IP"
}

output "az1" {
  value       = data.aws_availability_zones.available.names[0]
  description = "Availability Zone 1"
}
output "az2" {
  value       = data.aws_availability_zones.available.names[1]
  description = "Availability Zone 2"
}
