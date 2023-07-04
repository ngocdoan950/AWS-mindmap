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

resource "aws_security_group" "instance" {
  name = "sec_open_80"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-0ff89c4ce7de192ea"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  
  user_data = file("script.bash") //Đọc file script.bash cùng thư mục vào, tốt hơn dùng Heredoc syntax
  tags = {
    Name = "PythonWebServer"
  }
}