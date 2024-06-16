output "sg_id" {
  description = "ID of the provisioned security group"
  value       = aws_security_group.sg.id
}
