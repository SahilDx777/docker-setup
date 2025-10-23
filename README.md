# 🚀 Docker Installation Script for Ubuntu 22.04 / 24.04

This repository contains a **production-ready Bash script** to install and configure **Docker Engine**, **CLI**, **Containerd**, and **Docker Compose** on Ubuntu servers.

---

## 🧰 Features

✅ Installs official Docker packages (from Docker’s APT repo)  
✅ Enables and starts Docker + Containerd services  
✅ Adds your user to the `docker` group  
✅ Works on both **Ubuntu 22.04** and **Ubuntu 24.04**  
✅ Includes clean output formatting and safe error handling  
✅ Ready for automation (idempotent script — can run multiple times safely)

---

## 🧑‍💻 Usage

### 1️⃣ Clone this repository
```bash
git clone https://github.com/SahilDx777/docker-setup.git
cd docker-setup
```
### 2️⃣ Make the script executable
```bash
chmod +x install-docker.sh
```
### 3️⃣ Run the script
```bash
./install-docker.sh
```
### 🧾 Verify Installation
```bash
docker --version
docker info

docker run hello-world
```
### You should see:
```css
Hello from Docker!
This message shows that your installation appears to be working correctly.
```
