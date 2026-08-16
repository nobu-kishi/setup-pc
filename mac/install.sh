#!/bin/bash

# https://brew.sh/ja/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "パスワード入力してください（以後の処理で使います）"
sudo -v

# sudoのタイムスタンプ(通常5分)が切れないよう60秒ごとにリフレッシュ。
# スクリプト終了時にKEEP_ALIVE_PIDをkillするまで無期限に維持される。
while true; do
    sudo -n true
    sleep 60
done 2>/dev/null &
KEEP_ALIVE_PID=$!

# --- general ---
brew install --cask google-chrome
brew install --cask bettertouchtool
brew install --cask alt-tab
brew install --cask commander-one
brew install --cask tagspaces
brew install --cask vlc
brew install --cask parallels@19
brew install --cask raycast
brew install --cask rectangle
brew install displayplacer
brew install yt-dlp
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
brew install kubectl
brew install kind
brew install eksctl
brew install helm
brew install mise
brew install git
brew install git-lfs
brew install gh
brew install jq
brew install tree
brew install fzf
brew install neovim

# --- mise ---
# Corretto 21系の最新バージョン取得
corretto_version=$(mise ls-remote java | grep '^corretto-21' | sort -V | tail -n 1)

# インストールとグローバル設定を同時に行う（プロジェクト毎に設定したい場合は、-gオプションなしで実行）
mise use -g node@latest
mise use -g python@latest
mise use -g java@"$corretto_version"
mise use -g go@latest
mise use -g terraform@latest

# 依存ツールのインストール（mise管理下のnodeを使って実行）
mise exec -- npm i -g md-to-pdf

# --- Mac App Store ---
# Kindle
mas install 302584613
# CrystalFetch
mas install 6454431289
# The Unarchiver
mas install 425424353

kill "$KEEP_ALIVE_PID"
