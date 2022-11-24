resource "aws_s3_bucket" "bucket_practice" {
  bucket = "acme-storage-yelmi-practice"
}

resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.bucket_practice.bucket
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "web_site_conf" {
  bucket = aws_s3_bucket.bucket_practice.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}

resource "aws_s3_object" "upload" {
  for_each     = fileset("website/", "*")
  bucket       = aws_s3_bucket.bucket_practice.bucket
  key          = each.value
  source       = "website/${each.value}"
  etag         = filemd5("website/${each.value}")
  content_type = "text/html"
  acl          = "public-read"
}