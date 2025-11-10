# Raspberry Pi OS Trixie Tailscale Install Script
By Jordan Hardee

# About

This script may become unnecessary in the future or replaced by an official version. Check the [official page](https://tailscale.com/kb/1627/install-rpi-trixie) for updates!

The original command given by Tailscale requires apt-key which is deprecated. We don't want to add tailscale's (or any third-party's key) to our trusted key list as this is a security risk, but we do want to add it to a new keyrings directory and specify it as trusted. This simple bash script does exactly that.

# PREREQUISITES:

1. curl and wget must be installed.
2. This script must be run as an administrator.

# AFTER RUNNING THE SCRIPT:

Exit administrator shell and run "tailscale up" to add the device to your Tailscale instance.
Run "tailscale ip -4" to get your Tailscale IPv4 address.
You may want to consider disabling key expiry to prevent the need to periodically re-authenticate.
