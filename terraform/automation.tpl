#!/bin/bash
apt update
apt install kubectl
apt install curl
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 > get_helm.sh
less get_helm.sh
chmod +x get_helm.sh
./get_helm.sh

