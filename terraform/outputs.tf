output "s3_bucket_name" {
  description = "Name of the Terraform-managed S3 bucket"
  value       = aws_s3_bucket.terraform_demo.bucket
}

output "s3_bucket_arn" {
  description = "ARN of the Terraform-managed S3 bucket"
  value       = aws_s3_bucket.terraform_demo.arn
}

output "current_aws_region" {
  description = "AWS region Terraform is currently using"
  value       = data.aws_region.current.region
}

output "module_s3_bucket_name" {
  description = "Name of the S3 bucket created by the child module"
  value       = module.s3_bucket_demo.bucket_name
}

output "module_s3_bucket_arn" {
  description = "ARN of the S3 bucket created by the child module"
  value       = module.s3_bucket_demo.bucket_arn
}
