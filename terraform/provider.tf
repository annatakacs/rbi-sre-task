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