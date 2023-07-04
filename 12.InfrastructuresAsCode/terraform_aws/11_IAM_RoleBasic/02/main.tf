resource "aws_iam_role" "EC2_S3_RDS" {
  name = "EC2_S3_RDS"

  assume_role_policy = file("assume_role.json")
  //Bổ xung thêm 2 policy có sẵn là AmazonS3FullAccess và AmazonRDSFullAccess
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonS3FullAccess", "arn:aws:iam::aws:policy/AmazonRDSFullAccess"]
}
