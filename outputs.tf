output "cloudtrail_log_bucket_name" {
  description = "Name of the S3 bucket storing CloudTrail logs."
  value       = aws_s3_bucket.security_logs.bucket
}

output "kms_alias_name" {
  description = "Alias of the customer-managed KMS key used for log encryption."
  value       = aws_kms_alias.security_logs.name
}

output "cloudtrail_name" {
  description = "Name of the CloudTrail trail."
  value       = aws_cloudtrail.security_baseline.name
}
