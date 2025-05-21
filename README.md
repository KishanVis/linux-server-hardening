# Linux Server Hardening Script

A simple bash script to perform basic hardening of a Linux server (Ubuntu, Debian, CentOS, RHEL). This script is ideal for DevOps engineers, sysadmins, or cloud engineers who want to secure their servers quickly.

## 🔐 Features
- Disable root SSH login
- Enable firewall (UFW) with SSH open
- Set password aging policies
- Create a new sudo user
- Enable automatic security updates

## 💻 Usage

```bash
chmod +x harden.sh
sudo ./harden.sh
```

You'll be prompted to enter a new username during execution.

## ⚙️ Compatibility
Tested on:
- Ubuntu 20.04/22.04
- CentOS 7/8
- Debian 10/11
- RHEL 7/8

## 👨‍💻 Author
**Kishan Vishwakarma**  
RHCSA Certified | 3+ Years Linux Experience  
📫 [LinkedIn](https://linkedin.com/in/kishan-vishwakarma)

## 📄 License
This project is licensed under the MIT License.
