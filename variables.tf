variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "namespace" {
  description = "namespace"
  type        = string
  default     = "perf-test"
}

variable "emqx_instance_count" {
  description = "Instance count of emqx"
  type        = number
  default     = 3
}

variable "emqx_instance_type" {
  description = "Instance type of emqx"
  type        = string
  default     = "c5.large"
}

variable "s3_bucket_name" {
  description = "S3 Bucket"
  type        = string
  default     = "tf-emqx-performance-test"
}

variable "bench_id" {
  description = "Benchmark ID"
  type        = string
  default     = "test"
}

variable "package_file" {
  description = "Package file"
  type        = string
  default     = "emqx.deb"
}

variable "emqttb_package_url" {
  type    = string
  default = "https://github.com/emqx/emqttb/releases/download/v0.1.6/emqttb-0.1.6-ubuntu20.04-amd64-quic.tar.gz"
}

variable "emqttb_instance_count" {
  description = "Instance count of emqttb"
  type        = number
  default     = 1
}

variable "emqttb_instance_type" {
  description = "Instance type of emqttb"
  type        = string
  default     = "c5.large"
}

variable "emqttb_scenario" {
  description = "emqttb scenario"
  type        = string
  default     = "@pub --topic 't/%' --pubinterval 10ms --qos 1 --publatency 50ms --size 1kb --num-clients 10000 @sub --topic 't/%' --num-clients 10000"
}

variable "route53_zone_name" {
  description = "Hosted zone name"
  type        = string
  default     = "int.emqx.io"
}

variable "grafana_url" {
  description = "Grafana URL"
  type        = string
  default     = "https://perf-dashboard.emqx.works"
}

variable "grafana_api_key" {
  description = "Grafana API KEY"
  type        = string
  sensitive   = true
  default     = ""
}

variable "test_duration" {
  description = "Performance test duration"
  type        = string
  default     = "5min"
}

variable "ssh_key_name" {
  description = "SSH key name"
  type        = string
  default     = "emqx-perf-test"
}

variable "create_public_mqtt_nlb" {
  description = "Whether to create publicly exposed MQTT NLB on 1883"
  type        = number
  default     = 0
}

variable "use_emqttb" {
  description = "Whether to use emqttb to generate load"
  type        = number
  default     = 1
}

variable "use_emqtt_bench" {
  description = "Whether to use emqtt_bench to generate load"
  type        = number
  default     = 0
}

variable "emqtt_bench_package_url" {
  type    = string
  default = "https://github.com/emqx/emqtt-bench/releases/download/0.4.11/emqtt-bench-0.4.11-ubuntu20.04-amd64.tar.gz"
}
variable "emqtt_bench_instance_count" {
  description = "Instance count of emqtt_bench"
  type        = number
  default     = 1
}

variable "emqtt_bench_instance_type" {
  description = "Instance type of emqtt_bench"
  type        = string
  default     = "c5.large"
}

variable "emqtt_bench_scenario" {
  description = "emqtt_bench scenario"
  type        = string
  default     = "conn -c 100000 -i 10"
}

variable "internal_mqtt_nlb_count" {
  description = "Internal MQTT NLB count"
  type        = number
  default     = 1
}
