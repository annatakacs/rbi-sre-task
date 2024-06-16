terraform {
  backend "s3" {
    bucket         = "anna-tfstate"
    key            = "state/linux_tweet_app.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    dynamodb_table = "anna-tfstate"
    role_arn       = "arn:aws:iam::471112859559:role/terraform-role"
  }
}