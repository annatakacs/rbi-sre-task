output "record_name" {
  description = "Name of the registered Route53 record"
  value       = aws_route53_record.record.name
}