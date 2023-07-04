resource "aws_s3_bucket" "website" {
  bucket = "foodsite"
}

//Phân quyền S3 bucket
resource "aws_s3_bucket_acl" "website" {
  bucket = aws_s3_bucket.website.id
  acl    = "public-read"
}

//Cấu hình S3 để hosting web site
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

//Upload file lên S3 bucket
resource "aws_s3_object" "object" {
  for_each     = fileset(var.website_root, "**") //Duyệt tất cả các file trong thư mục var.website_root
  bucket       = aws_s3_bucket.website.id //Gắn object vào s3 bucket
  key          = each.key
  source       = "${var.website_root}/${each.key}"
  source_hash  = filemd5("${var.website_root}/${each.key}")
  acl          = "public-read"
  content_type = lookup(local.mime_types, regex("\\.[^.]+$", each.key), null) //Gán đúng mime type
}
