#!/usr/bin/env bash

echo "Installing Docker"

echo "Add Docker GPG key and repository"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

echo "Install Docker"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

echo "Allowing Docker execution without sudo"
sudo groupadd docker
sudo usermod -aG docker "$USER"
newgrp docker
