data "aws_route53_zone" "base_domain" {
  name = var.base_domain
}

resource "tls_private_key" "private_key" {
  algorithm = var.privat_key_algorithm
}

resource "acme_registration" "registration" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.email_address
}

resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.registration.account_key_pem
  common_name               = data.aws_route53_zone.base_domain.name
  subject_alternative_names = var.subject_alternative_names

  dns_challenge {
    provider = "route53"

    config = {
      AWS_HOSTED_ZONE_ID = data.aws_route53_zone.base_domain.zone_id
    }
  }

  depends_on = [acme_registration.registration]
}