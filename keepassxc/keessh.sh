#!/usr/bin/env bash

# This script is used to add an SSH key from KeePassXC to the ssh-agent.
set -eu

if [ $# -eq 0 ]; then
  echo "Usage: $0 [entry] [attachment]"
  echo Possible entries:
  keepassxc-cli search ~/keepass/main/Passwords.kdbx '*attachment:"kee"'
  exit 0
elif [ $# -eq 1 ]; then
  echo "Usage: $0 $1 [attachment]"
  echo Possible attachments:
  keepassxc-cli show --show-attachments --attributes Title ~/keepass/main/Passwords.kdbx $1
  exit 0
fi

keepassxc-cli attachment-export ~/keepass/main/Passwords.kdbx $1 $2 --stdout | ssh-add -
