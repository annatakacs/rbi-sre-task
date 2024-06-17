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

variable "create_lifecycle_policy" {
  description = "Determines whether a lifecycle policy is created"
  type        = bool
}

variable "repository_lifecycle_policy" {
  description = "JSON formatted string that contains the lifecycle policy"
  type        = string
}