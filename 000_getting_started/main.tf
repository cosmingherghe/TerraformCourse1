terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

variable "instance_type" {
  type = string
}

locals {
  project_name = "Cosmin"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c293f3f676ec4f90"
  instance_type = var.instance_type

  tags = {
    Name = "MyAppServer-${local.project_name}"
  }
}

output "public_ip" {
  value       = aws_instance.app_server.public_ip
  description = "The private IP address of the main server instance."
}