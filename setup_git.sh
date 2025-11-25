#!/bin/bash

# Configure push behavior
git config --global push.autoSetupRemote true

# Aliases
git config --global alias.st "status"
git config --global alias.sw "switch"
git config --global alias.cm "commit -m"
git config --global alias.cma "commit -a -m"
git config --global alias.pl "pull"
git config --global alias.plr "pull --rebase"
git config --global alias.ps "push"
git config --global alias.yeet '!git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'
git config --global alias.apply "stash apply"
git config --global alias.pop "stash pop"