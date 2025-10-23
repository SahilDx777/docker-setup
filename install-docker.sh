#!/usr/bin/env bash
# ==============================================================
# Docker Installation Script for Ubuntu 22.04/24.04 (Prod Ready)
# Author: <your name or team>
# Version: 1.0
# ==============================================================

set -e  # Exit immediately on error
set -o pipefail

# Colors for better output
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RESET="\e[0m"

echo -e "${CYAN}=== Updating system packages ===${RESET}"
sudo apt-get update -y
sudo apt-get install -y ca-certificates curl gnupg lsb-release

echo -e "${CYAN}=== Setting up Docker’s official GPG key ===${RESET}"
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo -e "${CYAN}=== Adding Docker repository ===${RESET}"
CODENAME=$(lsb_release -cs)
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu ${CODENAME} stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo -e "${CYAN}=== Installing Docker Engine, CLI, and dependencies ===${RESET}"
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo -e "${CYAN}=== Enabling and starting Docker services ===${RESET}"
sudo systemctl enable --now docker
sudo systemctl enable --now containerd

echo -e "${CYAN}=== Docker installed successfully! ===${RESET}"
docker --version
docker info | grep -i "Server Version" || true

# Optional: Add user to docker group
if ! groups $USER | grep -q "\bdocker\b"; then
    echo -e "${YELLOW}Adding current user to 'docker' group...${RESET}"
    sudo usermod -aG docker "$USER"
    echo -e "${YELLOW}You may need to log out and log back in or run: 'newgrp docker'${RESET}"
fi

echo -e "${GREEN}✅ Docker installation completed successfully.${RESET}"

