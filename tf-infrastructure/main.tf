terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.22"
      region  = "us-east-1"
    }
  }

  required_version = ">= 1.1.7"

  backend "s3" {
  }

}
