# general
alias sc="vi $HOME/.bashrc"
alias ssc="source $HOME/.bashrc"
alias mc="vi $HOME/.config/mise/config.toml"
alias vc="vi $HOME/.vimrc"
alias ac="vi $HOME/.aws/config"
alias h="history"
alias hg="history | grep "
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

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
alias dpa="docker image prune -a"
alias dpaf="docker image prune -a -f"
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

# other
alias pip="python -m pip" # mise経由で実行するためalias化

# miseをgit bashで使うためのパッチ処理も行う
# https://github.com/jdx/mise/discussions/3961?utm_source=chatgpt.com#discussioncomment-15286600
# https://mise.jdx.dev/getting-started.html
eval "$(mise activate bash | sed 's|eval "$(mise hook-env -s bash)";|& export PATH="$(/usr/bin/cygpath -u -p "$PATH")";|')"
