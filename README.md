AWS DevSecOps Security Baseline
Goal
This project builds a secure AWS logging baseline using Terraform.

The goal is to record AWS account activity with CloudTrail and store the logs in an encrypted S3 bucket. The logs are protected with public access blocking, SSE-KMS encryption, and a restricted bucket policy.

Architecture
Terraform is used as Infrastructure as Code to deploy the baseline into AWS.

CloudTrail records AWS account activity, including API calls and management events. CloudTrail writes the log files into an S3 bucket. The S3 bucket blocks public access and uses default server-side encryption with a customer-managed AWS KMS key.

The S3 bucket policy allows the CloudTrail service to write logs only to the expected AWSLogs account path.

assets/aws-devsecops-security-baseline.png


What This Builds
This project creates:

An S3 bucket for CloudTrail security logs
S3 public access block
A customer-managed AWS KMS key
A readable KMS alias
S3 default encryption using SSE-KMS
A bucket policy that allows CloudTrail to write logs
A multi-region CloudTrail with global service events and log file validation enabled

Security Controls
This baseline includes several security controls:

CloudTrail logging for AWS account activity
Multi-region trail enabled
Global service events included
Log file validation enabled
S3 public access blocked
S3 default encryption with SSE-KMS
Customer-managed KMS key
Restricted S3 bucket policy for CloudTrail writes
Terraform Commands
Common Terraform commands used in this project:

terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy


Verification
The project was verified by checking that:

The S3 bucket was created
Public access block was enabled
Default encryption used SSE-KMS
The KMS key and alias existed
CloudTrail was created and logging
CloudTrail log folders appeared in the S3 bucket
terraform plan showed no unexpected changes after deployment
Cleanup Notes
CloudTrail writes log objects into the S3 bucket. Because of that, terraform destroy can fail if the bucket is not empty.

For this learning lab, the bucket was manually emptied before running terraform destroy again.

In production, security logs should not be casually deleted because they may be needed for audit, investigation, or compliance.

Cost
This lab cost about $0.01 during testing.

A zero-spend budget alert was configured to warn if charges went above $0.01.

Lessons Learned
Terraform can only create, update, or destroy resources that the IAM identity is allowed to manage.

Creating, configuring, and deleting AWS resources often require separate IAM permissions.

CloudTrail needs permission to write logs into the S3 bucket.

S3 can use a customer-managed KMS key for default server-side encryption.

KMS key deletion is scheduled, not immediate.
