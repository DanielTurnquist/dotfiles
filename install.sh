#!/bin/bash
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

ln -sf "$DOTFILES/zsh/.zshrc" ~/.zshrc
ln -sf "$DOTFILES/zsh/.zprofile" ~/.zprofile
mkdir -p ~/.config/zellij
ln -sf "$DOTFILES/zellij/config.kdl" ~/.config/zellij/config.kdl

echo "Dotfiles linked."
