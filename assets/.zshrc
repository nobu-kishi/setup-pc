# general
alias -g O="| open"
alias -g C="| pbcopy"
alias -g F="| fzf"
alias -g G="| grep"
alias -g L="| less"
alias ll="ls -la"
alias sc="vi $HOME/.zshrc"
alias ssc="source $HOME/.zshrc"
alias vc="vi $HOME/.vimrc"
alias ac="vi $HOME/.aws/config"
alias h="history 0"
alias hg="history 0 | grep "
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# brew
alias b="brew"
alias bi="brew install"
alias bu="brew update"
alias bucg="brew upgrade --cask --greedy"

# Docker
alias d="docker"
alias dc="docker compose"
alias dcb="docker compose build"
alias dcr="docker compose run --rm"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dce="docker compose exec"
alias dcl="docker compose logs"
alias dps="docker ps"
alias di="docker images"
alias dr="docker rm"
alias dri="docker rmi"

# Terraform
alias tf="terraform"
alias tfc="terraform console"
alias tfi="terraform init"
alias tfiu="terraform init -upgrade"
alias tfp="terraform plan"
alias tfv="terraform validate"
alias tft="terraform fmt --recursive"
alias tftp="terraform fmt --recursive ../../"
alias tfaa="terraform apply -auto-approve"
function tfpl() { terraform plan -no-color | tee "plan_$(date +%Y%m%d_%H%M%S).log"; }
function tfaal() { terraform apply -auto-approve -no-color | tee "apply_$(date +%Y%m%d_%H%M%S).log"; }

# git
alias g="git"
alias ga="git add"
alias gca="git commit --amend"
alias gcm="git commit -m"
alias gcn="git clone"
alias gsw="git switch"
alias gswc="git switch -c"
alias gpl="git pull"
alias gph="git push"
alias gphf="git push --force"
alias gmrn="git merge --no-edit"
alias gmrs="git merge --squash"
alias gmra="git merge --abort"
alias gl="git log --oneline --graph --decorate --all"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias grs="git rebase --skip"

# path
export PATH="$HOME/repo/tools/aws:$PATH"
export PATH="$HOME/repo/tools/azure:$PATH"
export PATH="$HOME/repo/tools/utils:$PATH"
export PATH="$HOME/repo/tools/git:$PATH"
export PATH="$HOME/repo/tools/docker:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# direnv
export EDITOR=vim
eval "$(direnv hook zsh)"

# git-prompt
# https://qiita.com/mikan3rd/items/d41a8ca26523f950ea9d
source $HOME/.zsh/git-prompt.sh
fpath=($HOME/.zsh $HOME/.zsh $HOMEBREW_PREFIX/share/zsh/site-functions /usr/local/share/zsh/site-functions /usr/share/zsh/site-functions /usr/share/zsh/5.9/functions)
zstyle ':completion:*:*:git:*' script $HOME/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプトの表示設定
setopt PROMPT_SUBST
PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '
