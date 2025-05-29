#!/bin/bash

cp ../assets/.vimrc $HOME/.vimrc
cp ../assets/.aws/config $HOME/.aws/config
cp ../assets/.zshrc $HOME/.zshrc
source $HOME/.zshrc

asdf plugin add nodejs
asdf plugin add python
asdf plugin add golang
asdf plugin add terraform
asdf install nodejs latest
asdf install python latest
asdf install golang latest
asdf install terraform latest

# プロジェクト毎に設定したい場合は、-uオプションなしで実行
asdf set -u nodejs latest
asdf set -u python latest
asdf set -u golang latest
asdf set -u terraform latest

mkdir -p "$HOME/.zsh"
curl -o "$HOME/.zsh/git-prompt.sh" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o "$HOME/.zsh/git-completion.bash" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o "$HOME/.zsh/_git" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
