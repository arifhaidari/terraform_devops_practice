#!/bin/bash
# Récupérer l'adresse IP publique
export host_ip=$(curl -s ifconfig.io)

# Mettre à jour les paquets et installer K3s
sudo apt update -y
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable=traefik --tls-san=$host_ip" sh -

# Changer les permissions sur le fichier de configuration K3s
sudo chmod 644 /etc/rancher/k3s/k3s.yaml

# Exporter le kubeconfig
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
