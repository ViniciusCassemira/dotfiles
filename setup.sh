chmod -R +x ./scripts

sudo apt update && sudo apt install -y zsh

if [ "$SHELL" != "$(command -v zsh)" ]; then
  echo "⚠️ Zsh is not the default shell. Changing now..."
  chsh -s $(command -v zsh)
fi

echo "🗣️ After Oh My Zsh installation:"
echo ">_ ./setup2.sh"
./scripts/ohmyzsh/install.sh
