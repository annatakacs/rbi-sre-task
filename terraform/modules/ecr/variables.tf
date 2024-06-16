variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "repository_read_write_access_arns" {
  description = "List of IAM identities with read-write access"
  type        = list(string)
}

variable "repository_read_access_arns" {
  description = "List of IAM identities with read-only access"
  type        = list(string)
}