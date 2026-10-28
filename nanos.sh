#!/bin/bash
# Using standard /bin/bash since /usr/bin/env bash paths can change under sudo

set -Eeuo pipefail

# 1. Enforce root privileges cleanly instead of using 'sudo su'
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo: sudo ./your_script.sh"
  exit 1
fi

# 2. Check if sudo or standard paths exist
SUDO_PATH="/bin/sudo"
if [ -f "$SUDO_PATH" ] || command -v sudo &> /dev/null; then
    echo "sudo environment is available."
else
    echo "sudo does not exist."
fi

# 3. Detect Operating System and restrict apt commands to Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Running on Linux"
    
    echo "Updating packages and installing dependencies..."
    apt update && apt install -y git fish curl
    apt-get upgrade -y

elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Running on macOS - Skipping apt installation (Requires Homebrew)"
    exit 1
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    echo "Running on Windows environment - Skipping apt installation"
    exit 1
else
    echo "Unsupported Operating System: $OSTYPE"
    exit 1
fi

# 4. Set up installation paths
mkdir -p /os/other
echo "I'm not responsible for any damages"

echo "Backing up and downloading Oh My Fish installer..."
# Using non-root home directory context if available to prevent root-owned configs
USER_HOME=$(eval echo "~${SUDO_USER:-root}")

# Download installer cleanly
curl -sL https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > /os/other/install

echo "Installing Oh My Fish framework..."
# Run the installer through fish using noninteractive/yes flags to prevent terminal lockups
fish /os/other/install --noninteractive --yes --path="$USER_HOME/.local/share/omf" --config="$USER_HOME/.config/omf"

# 5. Finalize script permissions if file exists
if [ -f "nanos.sh" ]; then
    chmod +x nanos.sh
fi

echo "All done!"
apt-get upgrade
