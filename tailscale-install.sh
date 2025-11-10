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
