terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
    region = "ap-southeast-1"
  
}


resource "aws_s3_bucket" "newcreation" {
    bucket = "bucketforttform"

    tags = {
      "Name" = "Terafformbucket"
      "eve" = "dev"
    } 
  
} 
