# Terraform Variables

variable "prefix" {
  description = "Prefix for object creation"
  type        = string
  default     = "demo"
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

#variable "az" {
#  description = "AWS Availability Zone"
#  type        = string
#  default     = "us-east-1a"
#}

variable "az1" {
  description = "AWS Availability Zone 1"
  type        = string
  default     = "us-east-1a"
}

variable "az2" {
  description = "AWS Availability Zone 2"
  type        = string
  default     = "us-east-1b"
}

variable "ec2_key_name_az1" {
  description = "AWS az1 EC2 Key name for SSH access"
  type        = string
}

variable "ec2_key_name_az2" {
  description = "AWS az2 EC2 Key name for SSH access"
  type        = string
}


variable "license_key_az1" {
  description = "SSL Orchestrator license key (BYOL)"
  type        = string
}

variable "license_key_az2" {
  description = "SSL Orchestrator license key (BYOL)"
  type        = string
}

variable "admin_password" {
  description = "Password for the BIG-IP GUI/API"
  type        = string
  default     = "PleaseChangeM3!"
}

variable "mgmt_src_addr_prefixes" {
  description = "Allowed source IP prefixes for management access"
  type        = list(string)
}

variable "vpc_cidrs" {
  description = "VPC subnets (CIDR)"
  type        = map(string)
}

#variable "app_vip_az1" {
#  description = "IP address of az1 BIG-IP virtual server"
#  type        = string
#}

#variable "app_vip_az2" {
#  description = "IP address of az2 BIG-IP virtual server"
#  type        = string
#}


variable "instance_type" {
  description = "BIG-IP VM instance type - *.4xlarge supports up to 8 ENIs"
  type        = string
  default     = "m5.4xlarge"
}

variable "sslo_pkg_name" {
  description = "SSL Orchestrator built-in RPM package name (dependent on BIG-IP version)"
  type        = string
}

variable "sslo_ami" {
  description = "BIG-IP AMI - Default 16.1.0 (us-east-1)"
  type        = string
  default     = "ami-005468637cabaa930"
}

variable "inspection_ami" {
  description = "Inspection AMI - Default: Snort NIDS (us-east-1)"
  type        = string
  default     = "ami-0cdc9ccb73322825f"
}

variable "webapp_ami" {
  description = "Test web app AMI - Default: Wordpress"
  type        = string
  default     = "ami-05343502b4149e010"
}

