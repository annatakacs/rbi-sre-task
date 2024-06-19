provider "aws" {
  region              = "eu-north-1"
  allowed_account_ids = ["471112859559"]
  assume_role {
    role_arn = "arn:aws:iam::471112859559:role/terraform-role"
  }
  default_tags {
    tags = {
      Environment = "test"
      CreatedBy   = "Terraform"
      Project     = "rbi-sre-task"
    }
  }
}

provider "acme" {
  # server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}