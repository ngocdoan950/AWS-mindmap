terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.25"
    }
  }

  required_version = ">= 1.2.5"
}

provider "aws" {
  region  = "ap-southeast-1"
}

resource "aws_instance" "app1" {
  ami           = "ami-0ff89c4ce7de192ea"
  instance_type = "t2.micro"

  tags = {
    Name = "App1"
  }
}

//Cố tình gây lỗi ở thuộc tính ami
resource "aws_instance" "app2" {
  ami           = "ami-0ff89c4ce7de192ea"
  instance_type = "t2.micro"

  tags = {
    Name = "App2"
  }
}