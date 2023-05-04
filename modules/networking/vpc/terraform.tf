terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.76.1"
    }
  }
  required_version = "1.4.6"
}

provider "aws" {
  region = "us-east-1"
}
