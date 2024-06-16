### Global config

variable "subnet_id" {
  description = "ID of the subnet where EC2 is provisioned"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

### ECR config

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

### Route53 config

variable "route_name" {
  description = "Name of the desired hosted zone"
  type        = string
}

variable "route_type" {
  description = "The Route53 record type"
  type        = string
}

variable "route_ttl" {
  description = "The TTl of the Route53 record"
  type        = number
}

### SG config

variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "sg_description" {
  description = "Description of the security group"
  type        = string
}

### EC2 config

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
}
