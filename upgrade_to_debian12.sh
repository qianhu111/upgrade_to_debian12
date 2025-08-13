#!/bin/bash
set -e

echo "=== 1. 备份当前sources.list ==="
cp /etc/apt/sources.list /etc/apt/sources.list.bak

echo "=== 2. 替换sources.list为Debian 12 (bookworm) ==="
cat > /etc/apt/sources.list <<EOF
deb http://deb.debian.org/debian bookworm main contrib non-free
deb http://deb.debian.org/debian bookworm-updates main contrib non-free
deb http://security.debian.org/debian-security bookworm-security main contrib non-free
EOF

echo "=== 3. 更新软件包索引 ==="
apt update

echo "=== 4. 升级现有包到最新 ==="
apt upgrade -y

echo "=== 5. 执行完整升级 ==="
apt full-upgrade -y

echo "=== 6. 清理旧包 ==="
apt autoremove -y

echo "=== 7. 重启系统以应用升级 ==="
echo "升级完成，请手动重启系统：sudo reboot"
