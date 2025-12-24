# Path: .zshrc
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="aussiegeek"

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Source Oh My Zsh
if [ -d "$ZSH" ]; then
  source "$ZSH/oh-my-zsh.sh"
else
  echo "Oh My Zsh not found. Please install it first."
fi