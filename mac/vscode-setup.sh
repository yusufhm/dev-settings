#!/usr/bin/env bash

# Strict bash mode.
set -o errtrace
set -o errexit
set -o nounset

vs_user_dir=~/Library/Application\ Support/Code/User
vs_user_settings_file=${vs_user_dir}/settings.json
if [ -e "${vs_user_settings_file}" ]; then
    echo "VSCode installed and user settings file exists."
elif [ -d "${vs_user_dir}" ]; then
    echo "VSCode installed but no user settings file yet; linking file."
    ln -s `pwd`/vscode-settings.json ${vs_user_settings_file}
else
    echo "VSCode not installed"
fi