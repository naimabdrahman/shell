#!/bin/bash

# Backup the current sshd_config file
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bckup.$(date +%s)

# Use sed to uncomment and set PasswordAuthentication to no
sed -i 's/^#PasswordAuthentication no/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Reload the SSH service to apply changes
systemctl reload sshd

