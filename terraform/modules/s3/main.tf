resource "aws_s3_bucket" "example" {
  #checkov:skip=CKV_AWS_186: Encryption is not needed right now
  #checkov:skip=CKV_AWS_145 Encryption is not needed right now
  #checkov:skip=CKV2_AWS_62: Bucket notification is not needed right now
  #checkov:skip=CKV2_AWS_61: Lifecycle configuration is not needed right now
  #checkov:skip=CKV_AWS_21: Versioning is not needed right now
  #checkov:skip=CKV_AWS_18: Access logging is not needed right now
  #checkov:skip=CKV_AWS_144: Cross-region replication is not needed right now

  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "access_block" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}