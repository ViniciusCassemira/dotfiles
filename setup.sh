chmod -R +x ./

sudo apt update && sudo apt install -y zsh

if [ "$SHELL" != "$(command -v zsh)" ]; then
  echo "⚠️ config zsh as default shell"
  chsh -s "$(command -v zsh)"
  echo "✓ Zsh defined as default shell"

  export SHELL="$(command -v zsh)"
fi

echo "🗣️ After Oh My Zsh installation:"
echo ">_ ./setup2.sh"
zsh ./scripts/ohmyzsh/install.sh
