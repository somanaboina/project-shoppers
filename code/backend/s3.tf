resource "aws_s3_bucket" "bucket" {
  bucket            = "soma-ed-eos-terraform-state"
  object_lock_enabled = true  # Enable object lock on bucket creation
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_object_lock_configuration" "bucket_lock" {
  depends_on = [aws_s3_bucket_versioning.bucket_versioning]  # Ensure versioning is applied first
  bucket     = aws_s3_bucket.bucket.id

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}

