variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of EC2 security group IDs"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where EC2 is provisioned"
  type        = string
}

variable "create_iam_instance_profile" {
  description = "Decides whether to create an instance profile for EC2"
  type        = bool
}

variable "iam_role_name" {
  description = "Name of the EC2 instance profile"
  type        = string
}

variable "iam_role_policies" {
  description = "Map of IAM role policies to attach to EC2 instance profile"
  type        = map(string)
}

variable "user_data" {
  description = "User data executed at EC2 launch"
  type        = string
}

variable "key_name" {
  description = "Name of the ssh key to use for EC2 setup"
  type        = string
}