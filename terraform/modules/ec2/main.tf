module "ec2_instance" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-ec2-instance.git?ref=2c9e6156d375cf6adcfef95198318556f19f08f7"

  name = var.instance_name

  instance_type          = var.instance_type
  vpc_security_group_ids = [var.vpc_security_group_ids]
  subnet_id              = var.subnet_id

  create_iam_instance_profile = var.create_iam_instance_profile
  iam_role_name               = var.iam_role_name
  iam_role_policies           = var.iam_role_policies

  user_data = var.user_data

  key_name = var.key_name
}