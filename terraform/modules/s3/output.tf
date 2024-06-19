output "bucket_name" {
  description = "Name of the provisioned buckets"
  value       = aws_s3_bucket.example.id
}