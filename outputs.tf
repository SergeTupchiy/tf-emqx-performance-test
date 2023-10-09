output "emqx_core_public_ips" {
  description = "public ip of emqx core nodes"
  value       = module.emqx_core.public_ips
}

output "emqx_replicant_public_ips" {
  description = "public ip of emqx replicant nodes"
  value       = module.emqx_replicant.public_ips
}

output "emqttb_public_ips" {
  description = "public ip of emqttb instances"
  value       = module.emqttb.*.public_ips
}

output "emqtt_bench_public_ips" {
  description = "public ip of emqtt_bench instances"
  value       = module.emqtt_bench.*.public_ips
}

# output "emqx_mqtt_public_nlb_dns_name" {
#   description = "The DNS name of the MQTT Public NLB"
#   value       = module.emqx_mqtt_public_nlb.*.mqtt_lb_dns_name
# }

output "emqx_dashboard_url" {
  description = "EMQX Dashboard URL"
  value       = "http://${module.emqx_dashboard_lb.dashboard_dns_name}"
}

output "emqx_dashboard_credentials" {
  description = "EMQX Dashboard Credentials"
  value       = "admin:admin"
}

output "grafana_url" {
  description = "Grafana URL"
  value       = "http://${module.prometheus.public_ip}:3000"
}

output "grafana_credentials" {
  description = "Grafana Credentials"
  value       = "admin:admin"
}

output "prometheus_url" {
  description = "Grafana URL"
  value       = "http://${module.prometheus.public_ip}:9090"
}

output "otel_collector_public_ip" {
  description = "public IP of otel_collector instance"
  value       = module.otel_collector.public_ip
}

output "otel_collector_private_ip" {
  description = "private IP of otel_collector instance"
  value       = module.otel_collector.private_ip
}

output "jaeger_public_ip" {
  description = "public IP of jager instance"
  value       = module.jaeger.public_ip
}

output "jaeger_private_ip" {
  description = "private IP of jaeger instance"
  value       = module.jaeger.private_ip
}

output "s3_bucket_name" {
  value = var.s3_bucket_name
}

output "bench_id" {
  value = var.bench_id
}
