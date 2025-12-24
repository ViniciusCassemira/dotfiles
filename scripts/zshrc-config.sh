#!/usr/bin/env zsh
set -e

# Paths
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$SCRIPT_DIR/../configs/.zshrc"
TARGET="$HOME/.zshrc"

# Backup existing .zshrc
if [ -e "$TARGET" ]; then
  echo "Backing up existing .zshrc to .zshrc.bak"
  mv "$TARGET" "$TARGET.bak"
fi

# Create symlink
ln -s "$SOURCE" "$TARGET"
echo "✅ .zshrc linked successfully"

echo "🗣️ Restart terminal to apply the changes or type:"
echo ">_ source ~/.zshrc"
