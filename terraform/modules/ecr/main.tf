module "ecr" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-ecr.git?ref=27f48679600c7bc86528e0a95a9f221a5e1c5854"

  repository_name                   = var.repository_name
  repository_read_write_access_arns = var.repository_read_write_access_arns
  repository_read_access_arns       = var.repository_read_access_arns
  create_lifecycle_policy           = false
}