#!/bin/bash

# ------------------------------------------------------------------

# Raspberry Pi OS Trixie Tailscale Install Script
# By Jordan Hardee

# This script may become unnecessary in the future or replaced by an official version. Check https://tailscale.com/kb/1627/install-rpi-trixie for updates!

# The original command given by Tailscale requires apt-key which is deprecated. We don't want to add tailscale's (or any third-party's
# key) to our trusted key list as this is a security risk, but we do want to add it to a new keyrings directory and specify it as trusted.
# This simple bash script does exactly that.

#PREREQUISITES:

# 1. curl and wget must be installed.
# 2. This script must be run as an administrator.

# AFTER RUNNING THE SCRIPT:

# Exit administrator shell and run "tailscale up" to add the device to your Tailscale instance.
# Run "tailscale ip -4" to get your Tailscale IPv4 address.
# You may want to consider disabling key expiry to prevent the need to periodically re-authenticate.

# ------------------------------------------------------------------

	echo "Making /etc/apt/keyrings if it does not exist"
mkdir /etc/apt/keyrings
	echo "Downloading tailscale key .asc key to current working directory"
wget https://pkgs.tailscale.com/stable/raspbian/trixie.asc
	echo "Dearmoring key as needed, exporting key to current working directory"
gpg --output trixie.gpg --dearmor trixie.asc
	echo "Copying new .gpg key to /etc/apt/keyrings"
cp trixie.gpg /etc/apt/keyrings/trixie.gpg
	echo "Creating the same file given by the official website but we're specifying the key is signed by adding [signed-by=/etc/apt/keyrings/trixie.gpg] after deb"
echo "# Tailscale packages for raspbian trixie
deb [signed-by=/etc/apt/keyrings/trixie.gpg] https://pkgs.tailscale.com/stable/raspbian trixie main" > /etc/apt/sources.list.d/tailscale.list
	echo "Updating package list and installing tailscale."
apt-get update && sudo apt-get install tailscale
