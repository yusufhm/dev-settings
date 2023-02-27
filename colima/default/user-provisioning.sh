#!/bin/bash

echo starting user provisioning

# Provision only for Ubuntu layer.
[ ! -S "/run/containerd/containerd.sock" ] && exit 0
echo containerd is running
layer_id=$(nerdctl --namespace colima ps --filter name=ubuntu-layer --quiet)
[ -z "${layer_id}" ] && exit 0
echo ubuntu-layer is running

nerdctl -n colima exec ubuntu-layer bash -c '
    set -eux
    cd /home/yusuf.linux
    go install github.com/cortesi/modd/cmd/modd@latest

    pip install docker-compose

    mkdir -p sites

    [ ! -d ".oh-my-zsh" ] && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    [ ! -d ".asdf" ] && git clone https://github.com/asdf-vm/asdf.git .asdf --branch v0.11.1

    [ ! -L .zshrc ] && [ -f .zshrc ] && rm .zshrc
    ln -s /Users/yusuf/.zshrc .zshrc

    ln -s /Users/yusuf/.gitconfig .gitconfig
'
