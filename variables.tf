variable "region" {
  description = "eu-north-1"
  type        = string
}

variable "bucket_name" {
  description = "zoestaticwebsite"
  type        = string
}

variable "zone_id" {
  description = "Z02257722BQW0O8ZO5A3U"
  type        = string
}

variable "domain_name" {
  description = "zoeproject.com"
  type        = string
}

variable "api_name" {
  description = "zoe_static_website"
  type        = string
}

variable "api_description" {
  description = "This is my terraform api description"
  type        = string
}

variable "api_resource" {
  description = "deployment"
  type        = string
}
