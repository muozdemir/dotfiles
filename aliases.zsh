alias ~="~ && ls"
alias ..=".. && ls"
alias agrp='alias G'
alias code='open -a /Applications/Visual\ Studio\ Code.app/'
alias eject='diskutil unmountDisk /Volumes/UNTITLED && echo 🧑‍🚒'
alias cb='code ~/.bash_profile'
alias ci='~/.oh-my-zsh/custom/iterm_badges.zsh'
alias cz='code ~/.zshrc'
alias gb='git branch -vv'
alias gbu='git branch -u'
alias gcamm='git commit --amend -m'
alias gdc='git diff --cached'
alias gdm='git diff master...$(git rev-parse --abbrev-ref HEAD)'
alias gfp='git fetch --prune' # alternatively, "-p"
alias gpl='git pull'
alias gpom='git pull origin main'
alias gl='git log --oneline'  # overrides 'gl=git pull' from git plugin
alias grh='git reset --hard'
alias gr='g remote -vv'
alias gs='git status'  # alternative to 'gst' alias from git plugin
alias gsa='git stash apply' #  optionally: stash@{stash_index}
alias gsd='git stash drop'  # overrides 'gsd' alias from git plugin
alias gsl='git stash list'
alias gsp='git stash pop'
alias gss='git stash save'
alias gssh='git stash show'
alias gsshp='git stash show -p'
alias os='screen -L /dev/cu.usbserial 115200 –L'
alias show-usb='ls /Volumes/UNTITLED'
alias sls='screen -ls'
alias sx='screen -x'
alias sxq='screen -X quit'
alias sz='source ~/.zshrc'
alias usb='cd /Volumes/UNTITLED && ls'
alias va='vim ~/github/dotfiles/aliases.zsh'

copy-to-usb() { cp $1 /Volumes/UNTITLED }
lcd () { cd "${@:1}" && ls; }
mcd() { mkdir $1 && cd $1; }

# directories
alias bt='cd ~/bt && ls'
alias dotfiles='cd ~/github/dotfiles'
alias is='cd ~/bt/in-store && gs'
alias -g nginxconf='/usr/local/etc/nginx/nginx.conf'
alias nginxreload='sudo nginx -s stop && sudo nginx'

# global aliases (can appear anywhere in command string)
alias -g G='| grep -i' # case insensitive grep e.g. cat foo.txt G bar
alias -g Y='yes y |'

# suffix aliases (open with...)
alias -s jsx=code  # open jsx files with vscode
alias -s zsh=code  # open zsh files with vscode

# hide and show hidden files in Finder
alias hf='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias sf='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'

# https://apple.stackexchange.com/a/83923
# The changes aren't applied until you log out and back in. KeyRepeat can't be set between 2 (30 ms) and 1 (15 ms).
increasekeyrepeat () {
    defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
    defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
}

# docker
alias db='docker build'
dbt () { docker build -t $1 .; }
alias dc='docker-compose'
alias dcf='docker-compose -f' # use for any .yml file not named docker-compose.yml.
alias dei='docker exec -it'
alias di='docker images'
alias dia='docker images -a'
alias dkp='docker stop $(docker ps -aq) && docker rm $(docker ps -aq)'
alias dki='docker rmi $(docker images -aq)'
dkif () { dki -f; }
alias dl='docker logs'
alias dp='docker ps'
alias dpa='docker ps -a'
alias dr='docker run'
alias drmi='docker rmi'
alias drmif='docker rmi -f'
alias drp='docker run -p'
alias dsa='docker stop $(docker ps -aq)'
da () {
   printf '\n\n*****Images*****\n\n'
   dia
   printf '\n\n***Containers***\n\n'
   dpa
   printf '\n\n'
}
dk () { dkp || dkif; }
dka () { dk && dk; }
drun () { docker run -it $1; }
alias dvls='docker volume ls'
alias dvpf='docker volume prune -f'

# vagrant
alias vh='vagrant halt'
alias vs='vagrant status'
alias vu='vagrant up'

# tmux
alias ta='tmux a'
alias tat='tmux a -t'
alias tkst='tmux kill-session -t'
alias tls='tmux ls'
alias tlscm='tmux lscm'
alias tns='tmux new -s'

## BT specific
alias cdp='Y cpair d -p'
alias cl='cpair l'
alias cs='cpair s'
alias csp='cpair s -p'
alias cas='cpair -A sandbox'
alias casc='cas c && cas s'
alias casl='cas l'
alias cass='cas s'
alias cassp='cas s -p'
alias casdp='Y cas d -p'
alias css='cd ~/bt/cpair-setup-script'

# functions
cascp () { cas c -p $1 && cassp $1 }

ccp () { cpair c -p $1 && cpair s -p $1 }

load-usb () {
  export $(cat ~/bt/in-store/target/dist/signing.env | xargs)
  cp ~/bt/in-store/target/dist/Braintree-$BRAINTREE_VERSION-SIGNED.tgz /Volumes/UNTITLED
  eject
}

pas () {
  cd ~/bt/in-store
  ./pull_from_cpair_and_sign.sh $1
  load-usb && say signed || say insert usb
}
