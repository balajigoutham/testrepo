terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      Version = "~>3.27"
    }
  }

  required_version = ">=0.14.9" 

   backend "s3" {
       bucket = "[terrabucket1]"
       key    = "[arn:aws:kms:ap-south-1:593587691751:alias/aws/s3]"
       region = "ap-south-1"
   }
}

}

provider "aws" {
  version = "~>3.0"
  region  = "ap-south-1"
}
resource "aws_s3_bucket" "s3Bucket" {
     bucket = "[terrabucket1]"
     acl       = "public-read"

     policy  = <<EOF
{
     "id" : "MakePublic",
   "version" : "2012-10-17",
   "statement" : [
      {
         "action" : [
             "s3:GetObject"
          ],
         "effect" : "Allow",
         "resource" : "arn:aws:s3:::[terrabucket1]/*",
         "principal" : "*"
      }
    ]
  }
EOF

   website {
       index_document = "index.html"
   }
}
