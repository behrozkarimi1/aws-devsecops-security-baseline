resource "aws_s3_bucket" "security_logs" {
  bucket = "behroz-devsecops-security-logs-001"
}

resource "aws_s3_bucket_public_access_block" "security_logs" {
  bucket = aws_s3_bucket.security_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_kms_key" "security_logs" {
  description             = "KMS key for encrypting S3 security logs"
  enable_key_rotation     = true
  deletion_window_in_days = 10
}
