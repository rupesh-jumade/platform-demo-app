resource "aws_s3_bucket_versioning" "terraform_demo" {
  bucket = aws_s3_bucket.terraform_demo.id

  versioning_configuration {
    status = "Enabled"
  }
}
