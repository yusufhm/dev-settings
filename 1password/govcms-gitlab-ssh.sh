#!/usr/bin/env bash

# This script is used to add the SSH key for the GovCMS GitLab account to pygmy.

set -eu

SSHFILE=/tmp/colima/govcms-gitlab-ssh-key
PEMFILE="${SSHFILE}.pem"

rm -f "${PEMFILE}" "${SSHFILE}"
op read -o "${PEMFILE}" "op://Private/Gitlab SSH - GovCMS/private key"
chmod 400 "${PEMFILE}"
sshpk-conv "${PEMFILE}" -t openssh -p -o "${SSHFILE}"
rm -f "${PEMFILE}"
chmod 400 "${SSHFILE}"
pygmy addkey --key "${SSHFILE}"
rm -f "${SSHFILE}"
