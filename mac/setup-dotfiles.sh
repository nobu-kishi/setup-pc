#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ASSETS_DIR="$SCRIPT_DIR/../assets"

ln -sf "$ASSETS_DIR/.vimrc" "$HOME/.vimrc"
cp -R "$ASSETS_DIR/.aws" "$HOME/"
ln -sf "$ASSETS_DIR/.zshrc" "$HOME/.zshrc"
