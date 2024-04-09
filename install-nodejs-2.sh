#!/bin/bash

# List available Node.js modules
dnf module list nodejs

# Enable Node.js module version 18
dnf module enable -y nodejs:18

# Install Node.js without interaction/prompt
dnf install -y nodejs

# Check Node.js version
node --version













'''
dnf module list nodejs
dnf module enable nodejs:12
dnf install nodejs
node --version
'''
