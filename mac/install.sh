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

# --- general ---
brew install --cask microsoft-edge
brew install --cask alt-tab
brew install --cask commander-one
brew install --cask tagspaces
brew install --cask vlc
brew install --cask parallels@19
brew install yt-dlp
brew install libreoffice-language-pack --language=ja
brew install mas

# --- communication ---
brew install --cask slack
brew install --cask microsoft-teams
brew install --cask zoom

# --- document ---
brew install --cask notion
brew install --cask notion-calendar
brew install --cask obsidian
brew install --cask edrawmind
brew install --cask drawio

# --- ai ---
brew install --cask chatgpt
brew install --cask codex
brew install --cask claude
brew install --cask claude-code
brew install gemini-cli

# --- dev tools ---
brew install --cask visual-studio-code
brew install --cask zed
brew install --cask eclipse-java
brew install --cask docker
brew install --cask session-manager-plugin
brew install awscli
brew install azure-cli
brew install tflint
brew install direnv
brew install asdf
brew install git
brew install git-lfs
brew install gh
brew install jq
brew install tree
brew install fzf
brew install neovim

# --- Mac App Store ---
# Kindle
mas install 302584613
# CrystalFetch
mas install 6454431289
# The Unarchiver
mas install 425424353

kill "$KEEP_ALIVE_PID"
