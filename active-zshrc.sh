#!/usr/bin/env bash
set -e

# Paths
SOURCE="$(pwd)/.zshrc"
TARGET="$HOME/.zshrc"

# Backup existing .zshrc
if [ -e "$TARGET" ]; then
  echo "Backing up existing .zshrc to .zshrc.bak"
  mv "$TARGET" "$TARGET.bak"
fi

# Create symlink
ln -s "$SOURCE" "$TARGET"
echo ".zshrc linked successfully"

# Reload Zsh configuration
source ~/.zshrc