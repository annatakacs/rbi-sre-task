module "twitter_ecr_repo" {
  source = "./modules/ecr"

  repository_name                   = var.repository_name
  repository_read_write_access_arns = var.repository_read_write_access_arns
  repository_read_access_arns       = var.repository_read_access_arns
}

module "twitter_ec2_sg" {
  source = "./modules/security_group"

  sg_name     = var.sg_name
  sg_description = var.sg_description
  vpc_id      = var.vpc_id

  ingresses = {
    "http" = {
      description = "Allow inbound HTTP traffic"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    "https" = {
      description = "Allow inbound HTTPS traffic"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    "ssh" = {
      description = "Allow inbound SSH traffic"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egresses = {
    "first" = {
      description = "Allow all"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

module "twitter_ec2_instance" {
  source = "./modules/ec2"

  vpc_security_group_ids = module.twitter_ec2_sg.sg_id
  instance_name = var.instance_name
  instance_type = var.instance_type
  create_iam_instance_profile = true
  iam_role_name = "${var.instance_name}-role"
  iam_role_policies = {
    SSMAccess = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    ECRAccess = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  }
  subnet_id = var.subnet_id

  user_data = file("./scripts/user-data.sh")
  key_name = "pipeline"
}

module "twitter_route_entry" {
  source = "./modules/route53"

  zone_name     = "anna-takacs.com"
  private_zone  = false
  route_name    = var.route_name
  route_type    = var.route_type
  route_ttl     = var.route_ttl
  route_records = [ module.twitter_ec2_instance.ec2_public_ip ]

}