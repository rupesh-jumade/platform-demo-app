locals {
  common_tags = {
    Project     = "platform-demo-app"
    Environment = "dev"
    Owner       = "rupesh"
    ManagedBy   = "Terraform"
  }

  bucket_prefix = "platform-demo"
}
