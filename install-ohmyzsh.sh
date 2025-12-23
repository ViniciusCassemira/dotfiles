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
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH_DIR/custom}"
PLUGINS_DIR="$ZSH_CUSTOM/plugins"

echo "⚙️ Installing Oh My Zsh and plugins..."

if [ ! -d "$ZSH_DIR" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "🗣️ Oh My Zsh is already installed."
fi

mkdir -p "$PLUGINS_DIR"

install_plugin () {
  local name=$1
  local repo=$2

  if [ ! -d "$PLUGINS_DIR/$name" ]; then
    echo "⚙️ Installing plugin: $name"
    git clone "$repo" "$PLUGINS_DIR/$name"
  else
    echo "🗣️ Plugin $name is already installed"
  fi
}

install_plugin "zsh-autosuggestions" \
  "https://github.com/zsh-users/zsh-autosuggestions"

install_plugin "zsh-syntax-highlighting" \
  "https://github.com/zsh-users/zsh-syntax-highlighting"