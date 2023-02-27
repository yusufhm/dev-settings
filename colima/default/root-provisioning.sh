#!/bin/bash

echo starting root provisioning

# Provision only for Ubuntu layer.
[ ! -S "/run/containerd/containerd.sock" ] && exit 0
echo containerd is running
layer_id=$(nerdctl --namespace colima ps --filter name=ubuntu-layer --quiet)
[ -z "${layer_id}" ] && exit 0
echo ubuntu-layer is running

nerdctl -n colima exec -i ubuntu-layer bash -c '
    set -eux
    sudo apt-get update
    sudo DEBIAN_FRONTEND=noninteractive apt-get install --yes \
        direnv golang less \
        php8.1-cli php8.1-mysql php8.1-xml \
        python3 python3-pip vim zsh

    [ -f "/usr/local/bin/ahoy" ] && exit 0
    os=$(uname -s | tr [:upper:] [:lower:])
    architecture=$(case $(uname -m) in x86_64 | amd64) echo "amd64" ;; aarch64 | arm64 | armv8) echo "arm64" ;; *) echo "amd64" ;; esac)
    sudo curl -fsSL https://github.com/ahoy-cli/ahoy/releases/latest/download/ahoy-bin-$os-$architecture -o /usr/local/bin/ahoy
    sudo chown yusuf /usr/local/bin/ahoy
    sudo chmod +x /usr/local/bin/ahoy

    curl -OL https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar
    chmod +x drush.phar
    sudo mv drush.phar /usr/local/bin/drush

    sudo usermod --shell /bin/zsh yusuf
'
