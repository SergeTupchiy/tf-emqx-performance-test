terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

resource "aws_security_group" "instance_sg" {
  name        = "${var.namespace}-jaeger-instance-sg"
  description = "Allow all inbound traffic within sg, within VPC, external SSH access and all outbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    self             = true
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
  }

  ingress {
    from_port        = 16686
    to_port          = 16686
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 4317
    to_port          = 4317
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


module "jaeger_ec2" {
  source = "../ec2"

  namespace         = var.namespace
  instance_count    = 1
  instance_type     = var.instance_type
  ami_filter        = var.ami_filter
  sg_ids            = [aws_security_group.instance_sg.id]
  iam_profile       = var.iam_profile
  instance_name     = "jaeger"
  route53_zone_id   = var.route53_zone_id
  route53_zone_name = var.route53_zone_name
  key_name          = var.key_name
  subnet_id         = var.subnet_id
  s3_bucket_name    = var.s3_bucket_name
  extra_user_data   = templatefile("${path.module}/templates/user_data.tpl", {
  })
}
