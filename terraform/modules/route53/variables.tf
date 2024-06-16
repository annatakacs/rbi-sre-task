variable "zone_name" {
  description = "Route53 zone name"
  type        = string
}

variable "private_zone" {
  description = "Determines whether Route53 zone is private or public"
  type        = bool
}

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

variable "route_records" {
  description = "A list of Route53 records"
  type        = list(string)
}
