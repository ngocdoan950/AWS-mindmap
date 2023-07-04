//danh sách AZ trong region
data "aws_availability_zones" "available" {
  state = "available"
}

//danh sách running EC2 instances
data "aws_instances" "running_instances" {
  instance_state_names = ["running"] 
}

//Danh sách AMI
data "aws_ami" "amazon-linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-ebs"]
  }
}