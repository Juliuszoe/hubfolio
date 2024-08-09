# # output "bucket_name" {
# #   value = aws_s3_bucket.website_bucket.bucket
# # }

output "website_url" {
  value = "http://${module.route53.route53_record_name}"
}
