output "record_name" {
  description = "Name of the registered Route53 record"
  value       = module.twitter_route_entry.record_name
}

output "bucket_name" {
  description = "Name of the tweet cert bucket"
  value       = module.twitter_cert_bucket.bucket_name
}