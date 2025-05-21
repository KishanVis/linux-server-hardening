#!/bin/bash
# Linux Server Hardening Script

echo "Updating packages..."
if [ -x "$(command -v apt)" ]; then
  sudo apt update && sudo apt upgrade -y
elif [ -x "$(command -v yum)" ]; then
  sudo yum update -y
fi

echo "Disabling root SSH login..."
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart sshd

echo "Creating a new sudo user..."
read -p "Enter new username: " username
sudo adduser "$username"
sudo usermod -aG sudo "$username"

echo "Setting up UFW firewall..."
if [ -x "$(command -v ufw)" ]; then
  sudo ufw allow OpenSSH
  sudo ufw --force enable
fi

echo "Setting password policies..."
echo "PASS_MAX_DAYS 90" | sudo tee -a /etc/login.defs
echo "PASS_MIN_DAYS 10" | sudo tee -a /etc/login.defs
echo "PASS_WARN_AGE 7" | sudo tee -a /etc/login.defs

echo "Enabling automatic updates..."
if [ -f /etc/apt/apt.conf.d/20auto-upgrades ]; then
  echo 'APT::Periodic::Update-Package-Lists "1";' | sudo tee /etc/apt/apt.conf.d/20auto-upgrades
  echo 'APT::Periodic::Unattended-Upgrade "1";' | sudo tee -a /etc/apt/apt.conf.d/20auto-upgrades
fi

echo "Hardening complete. Reboot recommended."
