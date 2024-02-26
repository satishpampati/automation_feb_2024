terraform {
  required_version = "1.7.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
  backend "s3" {
    bucket         = "terraformstatefilestorelab"
    key            = "terraform-state-file-feb-24"
    region         = "ap-south-1"
    profile        = "terraform"
    dynamodb_table = "terraformstatetable"
  }

}

provider "aws" {
  profile = "terraform"
}