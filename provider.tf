terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }

  backend "s3" {
    bucket = "zoestaticwebsite"
    key    = "global/s3/terraform.tfstate"
    region = "eu-north-1"
  }
}
