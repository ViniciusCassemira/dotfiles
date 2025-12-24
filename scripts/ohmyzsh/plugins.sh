#!/usr/bin/env zsh
set -e
ZSH_DIR="$HOME/.oh-my-zsh"

if [ ! -d "$ZSH_DIR" ]; then
  echo "⚠️ Oh My Zsh is not installed. Please install it first."
  exit 1
fi

# Install plugins
ZSH_CUSTOM="$ZSH_DIR/custom/plugins"

if [ ! -d "$ZSH_CUSTOM/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/zsh-syntax-highlighting"
fi

echo "✅ Oh My Zsh plugins installed successfully!"
ls -a "$ZSH_CUSTOM"
