# Secure S3 Bucket Template

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "my-project"
}

# Common tags
locals {
  tags = {
    Project   = var.project_name
    ManagedBy = "terraform"
  }
}

# S3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  tags   = local.tags
}

# Enable versioning
resource "aws_s3_bucket_versioning" "bucket" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block public access
resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Lifecycle rule (optional)
resource "aws_s3_bucket_lifecycle_configuration" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    id     = "default"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    expiration {
      days = 365
    }
  }
}

# Outputs
output "bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  description = "S3 bucket ARN"
  value       = aws_s3_bucket.bucket.arn
}