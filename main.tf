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

resource "aws_kms_alias" "security_logs" {
  name          = "alias/devsecops-security-logs"
  target_key_id = aws_kms_key.security_logs.key_id
}

resource "aws_s3_bucket_server_side_encryption_configuration" "security_logs" {
  bucket = aws_s3_bucket.security_logs.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.security_logs.arn
      sse_algorithm     = "aws:kms"
    }
  }
}