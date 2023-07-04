resource "aws_iam_role" "s3_rds_role" {
  name = "S3_RDS_Role"

  assume_role_policy = file("assume_role_ec2.json")
  //Bổ xung thêm 2 policy có sẵn là AmazonS3FullAccess và AmazonRDSFullAccess
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonS3FullAccess", "arn:aws:iam::aws:policy/AmazonRDSFullAccess"]
}
