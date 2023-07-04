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

resource "aws_instance" "App1" {
  ami           = "ami-0ff89c4ce7de192ea"
  instance_type = "t2.micro"
  //Khai báo App1 phụ thuộc App2. App2 sẽ khởi động trước khi nào running, thì App1 sẽ được tạo
  depends_on = [
    aws_instance.App2
  ]
  tags = {
    Name = "App1"
  }
}

resource "aws_instance" "App2" {
  ami           = "ami-0ff89c4ce7de192ea"
  instance_type = "t2.micro"
  tags = {
    Name = "App2"
  }
}