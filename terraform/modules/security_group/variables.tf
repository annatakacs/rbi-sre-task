variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "sg_description" {
  description = "Description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "ingresses" {
  description = "Ingress rules for the security group"
  type = map(object({
    description = optional(string)
    from_port   = optional(number)
    to_port     = optional(number)
    protocol    = optional(string)
    cidr_blocks = optional(list(string))
  }))
}

variable "egresses" {
  description = "Egress rules for the security group"
  type = map(object({
    description = optional(string)
    from_port   = optional(number)
    to_port     = optional(number)
    protocol    = optional(string)
    cidr_blocks = optional(list(string))
  }))
}