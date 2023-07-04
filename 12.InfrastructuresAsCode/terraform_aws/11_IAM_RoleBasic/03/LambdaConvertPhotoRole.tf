resource "aws_iam_role" "LambdaConvertPhotoRole2" {
  name                = "LambdaConvertPhotoRole2"
  assume_role_policy  = file("assume_role.json")
  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]

  inline_policy {
    name   = "write_convert_photo"
    policy = file("write_convert_photo.json")
  }
  tags = {
    type = "Photo processing"
  }
}

resource "aws_iam_role_policy_attachment" "attach_LambdaConvertPhoto" {
  role       = aws_iam_role.LambdaConvertPhotoRole2.name
  policy_arn = aws_iam_policy.AccessS3Bucket.arn
}