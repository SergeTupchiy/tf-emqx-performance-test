output "private_ip" {
  description = "Private IP of ec2 instance"
  value       = module.otel_collector_ec2.private_ip
}

output "public_ip" {
  description = "Public IP of ec2 instance"
  value       = module.otel_collector_ec2.public_ip
}

output "instance_id" {
  value = module.otel_collector_ec2.instance_id
}

output "collector_url" {
  value = "http://${module.otel_collector_ec2.private_ip[0]}:4317"
}
