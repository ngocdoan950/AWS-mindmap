resource "aws_instance" "app" {
  ami             = "ami-0ff89c4ce7de192ea"
  instance_type   = "t2.micro"
  security_groups = ["app_secgroup"]
  tags = {
    Name = "app"
  }
}