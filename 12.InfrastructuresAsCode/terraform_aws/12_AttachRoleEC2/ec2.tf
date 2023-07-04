resource "aws_iam_instance_profile" "s3_rds_profile" {
  name = "S3_RDS_Profile"
  role = aws_iam_role.s3_rds_role.name
}

resource "aws_instance" "app_server" {
  ami                  = "ami-0ff89c4ce7de192ea"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.s3_rds_profile.name
  tags = {
    Name = "DemoIAMRole"
  }
}