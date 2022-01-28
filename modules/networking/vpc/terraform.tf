terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.0"
    }
  }
  required_version = "1.1.4"
}

provider "aws" {
  region = "us-east-1"
}
