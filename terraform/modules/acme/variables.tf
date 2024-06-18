variable "base_domain" {
  description = "Hosted zone name"
  type        = string
}

variable "privat_key_algorithm" {
  description = "Algorith of the private key"
  type        = string
}

variable "email_address" {
  description = "E-mail address registered with the requested certificate"
  type        = string
}

variable "subject_alternative_names" {
  description = "List of SANs to associate with the certificate"
  type        = list(string)
}

variable "bucket_name" {
  description = "Name of S3 bucket, where cert files are going to be uploaded"
  type        = string
}