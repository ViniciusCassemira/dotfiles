#!/usr/bin/env bash
set -e

# Check if Zsh is installed
if ! command -v zsh >/dev/null 2>&1; then
  echo "⚠️ Zsh is not installed. Please install it first:"
  echo ">_ sudo apt update && sudo apt install zsh -y"
  exit 1
fi

# Check if Zsh is the default shell
if [ "$SHELL" != "$(command -v zsh)" ]; then
  echo "⚠️ Zsh is not the default shell."
  echo "To change:"
  echo ">_ chsh -s $(command -v zsh)"
  exit 1
fi

# Check for required commands
for cmd in git curl; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "⚠️ Required command not found: $cmd"
    exit 1
  fi
done

# Variables
ZSH_DIR="$HOME/.oh-my-zsh"

echo "⚙️ Installing Oh My Zsh and plugins..."

if [ ! -d "$ZSH_DIR" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "🗣️ Oh My Zsh is already installed."
fi