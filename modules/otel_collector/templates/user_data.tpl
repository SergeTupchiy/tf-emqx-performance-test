wget https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.86.0/otelcol_0.86.0_linux_amd64.deb
dpkg -i otelcol_0.86.0_linux_amd64.deb

cat << EOF > /etc/otelcol/config.yaml
receivers:
  otlp:
    protocols:
      grpc:

exporters:
  otlp:
    endpoint: ${jaeger_private_url}
    tls:
      insecure: true

  logging:

processors:
  batch:

service:
  pipelines:
    traces:
      receivers: [otlp]
      processors: [batch]
      exporters: [logging, otlp]
    metrics:
      receivers: [otlp]
      processors: [batch]
      exporters: [logging]
EOF

systemctl restart otelcol.service
