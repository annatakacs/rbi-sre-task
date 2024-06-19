resource "aws_security_group" "sg" {
  #checkov:skip=CKV2_AWS_5: Security group will be attached in EC2 module

  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = try(var.ingresses, [])
    content {
      description = try(ingress.value.description, null)
      from_port   = try(ingress.value.from_port, null)
      to_port     = try(ingress.value.to_port, null)
      protocol    = try(ingress.value.protocol, null)
      cidr_blocks = try(ingress.value.cidr_blocks, null)
    }
  }

  dynamic "egress" {
    for_each = try(var.egresses, [])
    content {
      description = try(egress.value.description, null)
      from_port   = try(egress.value.from_port, null)
      to_port     = try(egress.value.to_port, null)
      protocol    = try(egress.value.protocol, null)
      cidr_blocks = try(egress.value.cidr_blocks, null)
    }
  }

  tags = {
    Name = var.sg_name
  }
}
