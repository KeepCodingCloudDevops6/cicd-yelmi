output "bucket_link" {
  value = aws_s3_bucket.bucket_practice.website_endpoint
}