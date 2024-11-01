# SmartPing 一键安装脚本

此项目提供了一个一键安装脚本 `install_smartping.sh`，用于在 Debian 系统上快速安装和启动 [SmartPing](https://github.com/smartping/smartping)。SmartPing 是一款网络监控工具，支持正/反向PING绘图、互PING拓扑绘图、报警等功能。
## 脚本说明

脚本将自动完成以下步骤：

1. 下载 SmartPing 安装包。
2. 解压文件到指定目录。
3. 配置 `systemd` 服务以支持开机自启动。
4. 启动 SmartPing 服务。
5. ## 系统要求

- Debian 系列系统（Debian 9/10/11，或兼容的 Ubuntu 版本）。
- 具有 `wget` 和 `tar` 命令的权限（可以通过 `apt install wget tar` 安装）。

## 安装步骤

1. 使用以下命令下载并运行一键安装脚本：

   ```bash
   wget https://raw.githubusercontent.com/Cd1s/install_smartping/refs/heads/main/install_smartping.sh -O install_smartping.sh && chmod +x install_smartping.sh && ./install_smartping.sh


---

## 使用方法

- **启动 SmartPing 服务**：

  ```bash
  sudo systemctl start smartping
- **停止 SmartPing 服务**：
  ```bash
  sudo systemctl stop smartping
---

## 访问 SmartPing

安装完成后，可以在浏览器中通过以下 URL 访问 SmartPing 的 Web 界面：
http://<服务器IP>:8899

默认管理密码为 `smartping`，您可以在 `conf/config.json` 中进行修改。

## 注意事项

- 确保服务器的 8899 端口已开放。
- 安装过程中如果遇到问题，可以查看 `systemctl status smartping` 或使用 `journalctl -u smartping` 查看日志。

- ## 卸载方法

如果需要卸载 SmartPing，可以执行以下命令：

```bash
sudo systemctl stop smartping
sudo systemctl disable smartping
sudo rm -rf /root/smartping-v0.8.0
sudo rm /etc/systemd/system/smartping.service
sudo systemctl daemon-reload
