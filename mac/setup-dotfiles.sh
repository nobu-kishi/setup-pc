#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ASSETS_DIR="$SCRIPT_DIR/../assets"

ln -sf "$ASSETS_DIR/.vimrc" "$HOME/.vimrc"
cp "$ASSETS_DIR/.aws/config" "$HOME/.aws/config"
ln -sf "$ASSETS_DIR/.zshrc" "$HOME/.zshrc"
source "$HOME/.zshrc"
