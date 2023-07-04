Ví dụ dựng Autoscaling group từ https://github.com/hashicorp/learn-terraform-aws-asg

https://amanjeev.com/blog/aws-load-balancers-and-health-checks-with-terraform

## Tôi đã sửa những gì?

1. Sửa lại file [script.sh](script.sh). File này lỗi khiến Apache server không thể khởi động dẫn đến Bad Health Check
2. Trong resource "aws_launch_configuration" "terramino" sửa thuộc tính `image_id = "ami-0ff89c4ce7de192ea"` để dùng AMI free tier mới nhất
3. Sửa lại `egress` trong `resource "aws_security_group" "terramino_instance" `

```hcl
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
```