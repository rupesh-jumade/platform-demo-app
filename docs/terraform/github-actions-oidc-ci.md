# Terraform + GitHub Actions CI

## Objective

Use GitHub Actions to automatically validate Terraform
and generate a Terraform plan.

## Workflow

Pull Request:
- terraform fmt -check
- terraform init -backend=false
- terraform validate

Push to main:
- GitHub OIDC authentication
- terraform fmt -check
- terraform init
- terraform validate
- terraform plan

No automatic terraform apply.

## GitHub OIDC

OIDC = OpenID Connect.

GitHub Actions obtains an OIDC token.
AWS IAM validates the token and allows the workflow
to assume the GitHubActions-Terraform-Role.

This avoids long-lived AWS access keys in GitHub.

## AWS IAM

Components:

1. GitHub OIDC provider
2. IAM role
3. IAM trust policy
4. Terraform CI permissions policy

The trust policy controls WHO can assume the role.

The permissions policy controls WHAT the role can do.

## Terraform Remote State

Terraform uses an S3 backend with state locking.

CI can:
- read/write Terraform state
- create/delete the lock file
- read the Terraform-managed S3 resources

## Troubleshooting

Initial Terraform plan failed because the CI role
did not have all S3 read permissions required by
the aws_s3_bucket resource refresh.

Errors encountered included:

- s3:GetBucketPolicy
- s3:GetBucketAcl
- s3:GetBucketCORS
- s3:GetBucketWebsite

The final solution was to provide read-only s3:Get*
permissions scoped to the two Terraform-managed buckets,
rather than adding individual permissions indefinitely.

## Final Result

GitHub Actions successfully authenticated to AWS using OIDC.

Terraform successfully executed:

- fmt -check
- init
- validate
- plan

Final plan:

No changes. Your infrastructure matches the configuration.
