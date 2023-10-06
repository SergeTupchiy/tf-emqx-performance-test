variable "namespace" {
  description = "namespace"
  type        = string
}

variable "ami_filter" {
  description = "AMI filter"
  type        = string
}

variable "route53_zone_name" {
  description = "Route53 Zone Name"
  type        = string
}

variable "route53_zone_id" {
  description = "Route53 Zone ID"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "m5.large"
}

variable "sg_ids" {
  description = "Security Group IDs"
  type        = list(string)
}

variable "key_name" {
  description = "SSH Key Name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 Bucket"
  type        = string
}

variable "iam_profile" {
  description = "IAM Instance Profile"
  type        = string
}

variable "jaeger_private_url" {
  description = "Jaeger private URL"
  type        = string
}
