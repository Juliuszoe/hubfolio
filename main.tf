provider "aws" {
  region = var.region
}

module "s3_bucket" {
  source          = "./modules/s3_bucket"
  bucket_name     = var.bucket_name
  index_document  = "index.html"
  error_document  = "error.html"
}

module "cloudfront" {
  source                = "./modules/cloudfront"
  s3_bucket_domain_name = module.s3_bucket.bucket_name
  default_root_object   = "index.html"
}

module "route53" {
  source                = "./modules/route53"
  zone_id               = var.zone_id
  domain_name           = var.domain_name
  cloudfront_domain_name = module.cloudfront.cloudfront_domain_name
  cloudfront_zone_id    = "Z2FDTNDATAQYW2"  # CloudFront Hosted Zone ID (always the same)
}

module "iam" {
  source          = "./modules/iam"
  s3_bucket_arn   = module.s3_bucket.bucket_name
}

# resource "aws_iam_role_policy_attachment" "attach_policy_cloudfront" {
#   role       = module.iam.cloudfront_access_role_name
#   policy_arn = module.iam.cloudfront_access_policy_arn
# }

output "iam_cloudfront_access_policy_arn" {
  value = module.iam.cloudfront_access_policy_arn
}


module "api_gateway" {
  source          = "./modules/api_gateway"
  api_name        = var.api_name
  api_description = var.api_description
  api_resource    = var.api_resource
}



resource "aws_s3_object" "index_html" {
  bucket = module.s3_bucket.bucket_name
  key    = "index.html"
  source = "index.html"
  acl    = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error_html" {
  bucket = module.s3_bucket.bucket_name
  key    = "error.html"
  source = "error.html"
  acl    = "public-read"
  content_type = "text/html"
}
