output "private_ip" {
  description = "Private IP of ec2 instance"
  value       = module.jaeger_ec2.private_ip
}

output "public_ip" {
  description = "Public IP of ec2 instance"
  value       = module.jaeger_ec2.public_ip
}

output "instance_id" {
  value = module.jaeger_ec2.instance_id
}

output "private_url" {
  value = "http://${module.jaeger_ec2.private_ip[0]}:4317"
}
