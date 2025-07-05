#!/bin/bash

# https://brew.sh/ja/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "パスワード入力してください（以後の処理で使います）"
sudo -v

# 5分間、sudo権限が維持されるのでその間に処理を実行
while true; do
    sudo -n true
    sleep 60
done 2>/dev/null &
KEEP_ALIVE_PID=$!

brew install --cask microsoft-edge
brew install --cask visual-studio-code
brew install --cask eclipse-java
brew install --cask chatgpt
brew install --cask commander-one
brew install --cask notion
brew install --cask notion-calendar
brew install --cask vlc
brew install --cask parallels@19
brew install --cask slack
brew install --cask microsoft-teams
brew install --cask edrawmind
brew install --cask drawio
brew install --cask session-manager-plugin
brew install --cask docker
brew install gemini-cli
brew install awscli
brew install azure-cli
brew install tflint
brew install direnv
brew install asdf
brew install git
brew install gh
brew install jq
brew install tree
brew install fzf
brew install neovim
brew install yt-dlp
brew install libreoffice-language-pack --language=ja
brew install mas

# Kindle
mas install 302584613
# CrystalFetch
mas install 6454431289
# The Unarchive
mas install 425424353
kill "$KEEP_ALIVE_PID"
