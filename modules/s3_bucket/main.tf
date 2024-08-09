resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
#   acl    = "private"

#   website {
#     index_document = var.index_document
#     error_document = var.error_document
#   }
}

output "bucket_name" {
  value = aws_s3_bucket.website_bucket.bucket
}

output "bucket_domain_name" {
  value = aws_s3_bucket.website_bucket.bucket_regional_domain_name
}

# output "unique_bucket_arn_output" {
#   value = aws_s3_bucket.website_bucket.arn
# }
