#!/bin/bash

# 1. 下载 SmartPing
echo "Downloading SmartPing..."
wget -O smartping-v0.8.0.tar.gz https://github.com/smartping/smartping/releases/download/v0.8.0/smartping-v0.8.0.tar.gz

# 2. 创建安装目录并解压
echo "Extracting SmartPing..."
mkdir -p /root/smartping-v0.8.0
tar -zxvf smartping-v0.8.0.tar.gz -C smartping-v0.8.0

# 3. 创建 systemd 服务文件
echo "Creating systemd service..."
cat <<EOT > /etc/systemd/system/smartping.service
[Unit]
Description=SmartPing Service
After=network.target

[Service]
Type=simple
WorkingDirectory=/root/smartping-v0.8.0
ExecStart=/root/smartping-v0.8.0/bin/smartping
ExecStop=/root/smartping-v0.8.0/control stop
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOT

# 4. 赋予执行权限
echo "Setting executable permissions..."
chmod +x /root/smartping-v0.8.0/control
chmod +x /root/smartping-v0.8.0/bin/smartping

# 5. 重新加载 systemd 并启动 SmartPing 服务
echo "Enabling and starting SmartPing service..."
systemctl daemon-reload
systemctl enable smartping
systemctl start smartping

echo "SmartPing installation and startup complete!"
