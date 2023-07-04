//Security Group cho EC2 instances
resource "aws_security_group" "terramino_instance" {
  name = "learn-asg-terramino-instance"
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.terramino_lb.id] //chỉ nhận request từ Load Balancer
  }

  ingress { //Cho phép SSH từ bất kỳ địa chỉ nào
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress { //Cho phép mở tất cả cổng kết nối ra bên ngoài
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    //security_groups = [aws_security_group.terramino_lb.id] //chỉ nhận request từ Load Balancer
  }
  vpc_id = module.vpc.vpc_id
}
//Security Group cho Load Balancer
resource "aws_security_group" "terramino_lb" {
  name = "learn-asg-terramino-lb"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = module.vpc.vpc_id
}
