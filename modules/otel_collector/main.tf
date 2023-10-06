terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

module "otel_collector_ec2" {
  source = "../ec2"

  namespace         = var.namespace
  instance_count    = 1
  instance_type     = var.instance_type
  ami_filter        = var.ami_filter
  sg_ids            = var.sg_ids
  iam_profile       = var.iam_profile
  instance_name     = "otel_collector"
  route53_zone_id   = var.route53_zone_id
  route53_zone_name = var.route53_zone_name
  key_name          = var.key_name
  subnet_id         = var.subnet_id
  s3_bucket_name    = var.s3_bucket_name
  extra_user_data   = templatefile("${path.module}/templates/user_data.tpl", {
     jaeger_private_url = var.jaeger_private_url
  })
}

