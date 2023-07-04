resource "aws_iam_policy" "AccessS3Bucket" {
  name        = "AccessS3Bucket"
  description = "Access S3 Bucket: inphoto and outphoto"

  policy = file("access_bucket.json")
}
