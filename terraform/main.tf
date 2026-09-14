terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "terraform_demo" {
  bucket = "platform-demo-terraform-${data.aws_caller_identity.current.account_id}"

  tags = merge(
    local.common_tags,
    {
      Name = "terraform-demo"
    }
  )
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

module "s3_bucket_demo" {
  source = "./modules/s3-bucket"

  bucket_name = "platform-demo-module-${data.aws_caller_identity.current.account_id}"

  tags = merge(
    local.common_tags,
    {
      Name = "terraform-module-demo-v2"
    }
  )
}
