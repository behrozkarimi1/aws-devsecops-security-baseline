variable "aws_region" {
  description = "AWS region used as the CloudTrail region."
  type        = string
  default     = "us-west-1" # Desired AWS region
}

variable "cloudtrail_log_bucket_name" {
  description = "Name of the S3 bucket used to store CloudTrail logs."
  type        = string
  default     = "behroz-devsecops-security-logs-001"
}

variable "kms_alias_name" {
  description = "Alias name for the customer-managed KMS key."
  type        = string
  default     = "alias/devsecops-security-logs"
}

variable "cloudtrail_name" {
  description = "Name of the CloudTrail trail."
  type        = string
  default     = "devsecops-security-baseline-trail"
}