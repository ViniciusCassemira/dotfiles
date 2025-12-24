#!/usr/bin/env bash
set -e

chmod +x install-ohmyzsh.sh
chmod +x active-zshrc.sh

./install-ohmyzsh.sh
./active-zshrc.sh

echo "✅ configuration complete!"
echo "⚠️  Execute 'source ~/.zshrc' or open a new terminal to apply the changes."