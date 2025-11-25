#!/bin/bash
[ ! -e ~/.config/starship.toml ] && ln -s $(pwd)/starship.toml ~/.config/starship.toml || echo "✓ starship.toml already exists"
