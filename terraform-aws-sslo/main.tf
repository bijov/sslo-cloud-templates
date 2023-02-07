## Set Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

## Configure the AWS Provider
provider "aws" {
  region = var.region
}
data "aws_availability_zones" "available" {
  state = "available"
}
locals {
  az1 = var.az1 != null ? var.az1 : data.aws_availability_zones.available.names[0]
  az2 = var.az2 != null ? var.az2 : data.aws_availability_zones.available.names[1]
}


