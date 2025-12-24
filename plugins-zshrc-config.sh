#!/usr/bin/env zsh
set -e
ZSH_DIR="$HOME/.oh-my-zsh"

if [ -d "$ZSH_DIR" ]; then
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

echo "✅ Oh My Zsh and plugins installed successfully."
echo "🗣️ Please restart your terminal or run 'source ~/.zshrc' to apply the changes."