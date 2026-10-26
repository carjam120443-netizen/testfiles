#!/bin/bash
# Prevent the script from continuing if a command fails
set -e

# 1. Refresh the package lists from the repositories
sudo apt update

# 2. Upgrade all installed packages automatically
sudo apt upgrade -y

# 3. Print out system information
echo "--- System Info ---"
uname -a             # Prints kernel version and architecture
hostnamectl          # Prints OS name, architecture, and machine ID
