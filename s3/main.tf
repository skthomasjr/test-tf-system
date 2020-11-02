terraform {
  required_version = "~> 0.13.2"
}

provider "aws" {
  region  = var.region
}

# ----- Bucket -----
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
  acl    = var.acl

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = var.versioning
  }

  tags           = var.tags
}
