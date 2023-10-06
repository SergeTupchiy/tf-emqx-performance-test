cd /opt
mkdir jaeger && cd jaeger
wget "https://github.com/jaegertracing/jaeger/releases/download/v1.49.0/jaeger-1.49.0-linux-amd64.tar.gz" -O ./jaeger.tar.gz
tar --strip-components=1 -xzf ./jaeger.tar.gz

cat << EOF > /lib/systemd/system/jaeger.service
[Unit]
Description=Jaeger
After=network.target

[Service]
ExecStart=:/opt/jaeger/jaeger-all-in-one
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now jaeger.service
