#!/usr/bin/env bash

# This script is used to add the SSH key for the GovCMS GitLab account to pygmy.

set -eu

SSHFILE=/tmp/colima/govcms-gitlab-ssh-key
PEMFILE="${SSHFILE}.pem"

rm -f "${PEMFILE}" "${SSHFILE}"
op read -o "${PEMFILE}" "op://Private/Gitlab SSH - GovCMS/private key"

# Convert the PEM private key from 1Password to OpenSSH format.
# Install sshpk using `npm install -g sshpk`.
sshpk-conv "${PEMFILE}" -t openssh -p -o "${SSHFILE}"
rm -f "${PEMFILE}"

chmod 400 "${SSHFILE}"
pygmy addkey --key "${SSHFILE}"
rm -f "${SSHFILE}"
