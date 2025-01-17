#!/usr/bin/env bash

# This script is used to create an AWS session token using MFC from 1password.
set -eu

AWS_REGION=${AWS_REGION:-"ap-southeast-2"}
AWS_AUTH_PROFILE=${AWS_AUTH_PROFILE}
AWS_OTP_ONEPASS_ITEM_NAME=${AWS_OTP_ONEPASS_ITEM_NAME}
AWS_MFC_DEVICE_ARN=${AWS_MFC_DEVICE_ARN}
AWS_MFA_PROFILE=${AWS_MFA_PROFILE}

# Get the MFA token from 1password.
MFA_TOKEN=$(op read "op://Employee/${AWS_OTP_ONEPASS_ITEM_NAME}/one-time password?attribute=otp")
AWS_TOKEN=$(aws --profile ${AWS_AUTH_PROFILE} sts get-session-token \
  --serial-number ${AWS_MFC_DEVICE_ARN} --token-code ${MFA_TOKEN})

# Configure the profile.
aws configure set region ${AWS_REGION} --profile ${AWS_MFA_PROFILE}
access_key_id=$(echo $AWS_TOKEN | jq -r '.Credentials.AccessKeyId')
secret_access_key=$(echo $AWS_TOKEN | jq -r '.Credentials.SecretAccessKey')
session_token=$(echo $AWS_TOKEN | jq -r '.Credentials.SessionToken')
aws configure set aws_access_key_id ${access_key_id} --profile ${AWS_MFA_PROFILE}
aws configure set aws_secret_access_key ${secret_access_key} --profile ${AWS_MFA_PROFILE}
aws configure set aws_session_token ${session_token} --profile ${AWS_MFA_PROFILE}
