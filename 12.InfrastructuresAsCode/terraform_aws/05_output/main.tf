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

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "message" {
  description = "Message show on web site"
  type        = string
  default     = "Welcome to Terraform"
}

resource "aws_security_group" "instance" {
  name = "sec_open"
  description = "Open inbound port to EC2"
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_instance" "app_server" {
  ami           = "ami-0ff89c4ce7de192ea"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  
  user_data = <<-EOF
              #!/bin/bash
              echo ${var.message} > index.html
              sudo python3 -m http.server 8080 &
              EOF

  tags = {
    Name = "PythonWebServer"
  }
}

output "instance_ips" {
  value = aws_instance.app_server.*.public_ip
}