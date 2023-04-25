#!/bin/sh
# Script to install Hashicorp Vault CLI and start vault server in Dev mode

# Install GPG
sudo apt update && sudo apt install gpg

# Get Hashicorp GPG key
# Download the signing key to a new keyring
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Verify the key's fingerprint
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

# Add Hashicorp Repo
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Run apt update to get the Hashicorp packages
sudo apt update

# Install vault. Use `vault-enterprise` to install enterprise version
sudo apt install vault

# Run vault CLI command
vault

# Anytime run a command with -h option to see the sub-commands and usage of the specific command
vault server -h
# Start the vault server in dev mode
vault server -dev &
