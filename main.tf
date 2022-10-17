terraform {
   # Terraform version at the time of writing this post
  required_version = ">= 0.13.0"
   backend "s3" {
    bucket = "cloudquickpocsbackendtf"
    key = "quickcloudpocsbackendtfstate"
    region = "us-east-1"
   }
 }
 provider "aws" {
  region = "us-east-1"
}
