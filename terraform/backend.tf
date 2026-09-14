terraform {
  backend "s3" {
    bucket       = "platform-demo-terraform-058862856960-state"
    key          = "platform-demo-app/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}
