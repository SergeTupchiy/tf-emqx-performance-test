output "emqx_public_ips" {
  description = "public ip of emqx instances"
  value       = module.emqx.public_ips
}

output "emqttb_public_ips" {
  description = "public ip of emqttb instances"
  value       = module.emqttb.public_ips
}

output "emqx_elb_dns_name" {
  description = "elb dns name"
  value       = module.emqx_lb.elb_dns_name
}
