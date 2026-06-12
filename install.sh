#!/bin/bash
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

ln -sf "$DOTFILES/zsh/.zshrc" ~/.zshrc
ln -sf "$DOTFILES/zsh/.zprofile" ~/.zprofile
mkdir -p ~/.config/zellij
ln -sf "$DOTFILES/zellij/config.kdl" ~/.config/zellij/config.kdl

# Zsh plugins
ZSH_PLUGINS="$HOME/.local/share/zsh/plugins"
mkdir -p "$ZSH_PLUGINS"
[ -d "$ZSH_PLUGINS/zsh-vi-mode" ] || git clone https://github.com/jeffreytse/zsh-vi-mode "$ZSH_PLUGINS/zsh-vi-mode"
[ -d "$ZSH_PLUGINS/zsh-autosuggestions" ] || git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGINS/zsh-autosuggestions"
[ -d "$ZSH_PLUGINS/zsh-syntax-highlighting" ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_PLUGINS/zsh-syntax-highlighting"

echo "Dotfiles linked."
