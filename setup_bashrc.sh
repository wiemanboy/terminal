#!/bin/bash

# Check if running in WSL
IS_WSL=false
if grep -qi microsoft /proc/version 2>/dev/null; then
    IS_WSL=true
    echo "✓ Running in WSL"
fi
echo ""

add_to_bashrc() {
    local marker="$1"
    local content="$2"
    local bashrc="$HOME/.bashrc"
    
    # Check if the marker already exists in .bashrc
    if ! grep -q "$marker" "$bashrc" 2>/dev/null; then
        echo "" >> "$bashrc"
        echo "$content" >> "$bashrc"
        echo "✓ Added $marker to .bashrc"
    else
        echo "✓ $marker already exists in .bashrc, skipping"
    fi
}

# Windows shortcuts section (only in WSL)
if [ "$IS_WSL" = true ]; then
    WSL_SHORTCUTS='# windows shortcuts
w="/mnt/c"
wh=$w"/Users/JarnoW"
wdl=$wh"/Downloads"
whosts=$w"/Windows/System32/drivers/etc/hosts"
hosts="C:\Windows\System32\drivers\etc\hosts"

# windows app aliases
alias explorer="Explorer.exe"'

    add_to_bashrc "# wsl shortcuts" "$WSL_SHORTCUTS"
fi

GENERAL_SHORTCUTS='# general shortcuts
netshoot="nicolaka/netshoot"
kubeconfig="$HOME/.kube/config"'

add_to_bashrc "# general shortcuts" "$GENERAL_SHORTCUTS"

GENERAL_ALIASES='# general aliases
alias localtalos='"'"'docker start $(docker ps -a --format "{{.Names}}" | grep talos)'"'"''

add_to_bashrc "# general aliases" "$GENERAL_ALIASES"

STARSHIP_CONFIG='# custom terminal
eval "$(starship init bash)"'

add_to_bashrc "# custom terminal" "$STARSHIP_CONFIG"

BREW_CONFIG='# brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'

add_to_bashrc "# brew" "$BREW_CONFIG"
