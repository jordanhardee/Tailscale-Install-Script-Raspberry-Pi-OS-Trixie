# Raspberry Pi OS Trixie - Tailscale Install Script README

# SCRIPT (Without comments or echo descriptions of commands):

        #!/bin/bash
        
        mkdir /etc/apt/keyrings
        wget https://pkgs.tailscale.com/stable/raspbian/trixie.asc
        gpg --output trixie.gpg --dearmor trixie.asc
        cp trixie.gpg /etc/apt/keyrings/trixie.gpg
        echo "# Tailscale packages for raspbian trixie
        deb [signed-by=/etc/apt/keyrings/trixie.gpg] https://pkgs.tailscale.com/stable/raspbian trixie main" > /etc/apt/sources.list.d/tailscale.list
        	echo "Updating package list and installing tailscale."
        rm trixie.asc
        rm trixie.gpg
        apt-get update && sudo apt-get install tailscale

Download an install script or copy-paste the above and save it as tailscale-install.sh or whatever .sh filename you'd like. 
Be sure to run chmod +x to ensure it's executable! Then as an administrator run the command (i.e. ./tailscale-install.sh).

# About

This script may become unnecessary in the future or replaced by an official version. Check the [official page](https://tailscale.com/kb/1627/install-rpi-trixie) for updates!

The original command given by Tailscale requires apt-key which is deprecated. We don't want to add tailscale's (or any third-party's key) to our trusted key list as this is a security risk, but we do want to add it to a new keyrings directory and specify it as trusted. This simple bash script does exactly that.

Script by Jordan Hardee.

# PREREQUISITES:

1. wget must be installed.
2. This script must be run as an administrator.

# AFTER RUNNING THE SCRIPT:

Exit administrator shell and run "tailscale up" to add the device to your Tailscale instance.
Run "tailscale ip -4" to get your Tailscale IPv4 address.
You may want to consider disabling key expiry to prevent the need to periodically re-authenticate.
