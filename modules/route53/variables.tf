variable "zone_id" {
  description = "The ID of the hosted zone"
  type        = string
}

variable "domain_name" {
  description = "The domain name"
  type        = string
}

variable "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  type        = string
}

variable "cloudfront_zone_id" {
  description = "The zone ID for CloudFront"
  type        = string
}
