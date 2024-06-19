resource "aws_s3_object" "certificate_artifacts_s3_objects" {
  for_each = toset(["certificate_pem", "issuer_pem", "private_key_pem"])

  bucket  = var.bucket_name
  key     = "ssl-certs/${each.key}"
  content = lookup(acme_certificate.certificate, "${each.key}")
}