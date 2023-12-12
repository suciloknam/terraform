# Define AWS provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}
provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16" # Change this to your desired CIDR block for the VPC

  tags = {
    Name = "MyVPC"
  }
}

# Create a subnet within the VPC
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block             = "10.0.1.0/24" # Change this to your desired CIDR block for the subnet
  availability_zone       = "us-east-1a" # Change this to your desired availability zone
  map_public_ip_on_launch = true # Set this to true if you want instances in this subnet to receive public IP addresses

  tags = {
    Name = "MySubnet"
  }
}
