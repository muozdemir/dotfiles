alias ~="~ && ls"
alias ..=".. && ls"
alias agrp='alias G'
alias code='open -a /Applications/Visual\ Studio\ Code.app/'
alias ca='~/.oh-my-zsh/custom/aliases.zsh'
alias va='vim ~/.oh-my-zsh/custom/aliases.zsh'
alias cb='code ~/.bash_profile'
alias ci='~/.oh-my-zsh/custom/iterm_badges.zsh'
alias ni='nn ~/.oh-my-zsh/custom/iterm_badges.zsh'
alias cz='code ~/.zshrc'
alias nz='nn ~/.zshrc'
alias gb='git branch -vv'
alias gbu='git branch -u'
alias gdc='git diff --cached'
alias gdm='git diff master...$(git rev-parse --abbrev-ref HEAD)'
alias gfp='git fetch --prune' # alternatively, "-p"
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
mcd() { mkdir $1 && cd $1; }
alias sharks='sharks --copy'
alias gencontext='gencontext -c'

# directories
alias bt='cd ~/bt && ls'
alias dotfiles='cd ~/github/dotfiles'
alias is='cd ~/bt/in-store && gs'
alias pypl='cd ~/pypl && ls'
alias s='cd ~/github/sharks && gs'
alias -g nginxconf='/usr/local/etc/nginx/nginx.conf'
alias nginxreload='sudo nginx -s stop && sudo nginx'
alias -g npmroot='$(npm -g root)'

# global aliases (can appear anywhere in command string)
alias -g G='| grep -i' # case insensitive grep e.g. cat foo.txt G bar

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

lcd () { cd "${@:1}" && ls; }
alias nn='nano'
alias nnn='nn ~/.nanorc'
alias sz='source ~/.zshrc'

# node
alias ne='npx eslint'
alias nef='npx eslint --fix'
alias wnjw='npx jest --watch --collectCoverage false --config ./jest.widget.config.js'
alias nj='npx jest --collectCoverage false'
alias njc='npx jest'
alias njw='npx jest --watch --collectCoverage false'
alias njwc='npx jest --watch'
alias nrb='npm run build'
alias nrl='npm run lint'
alias nrt='npm run test'
alias nrmi='rm -rf node_modules; rm -rf package-lock.json; npm i'

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

# cpair
alias ccp='cpair c -p'
alias cdp='cpair d -p'
alias cl='cpair l'
alias cs='cpair s'
alias csp='cpair s -p'

# tmux
alias ta='tmux a'
alias tat='tmux a -t'
alias tkst='tmux kill-session -t'
alias tls='tmux ls'
alias tlscm='tmux lscm'
alias tns='tmux new -s'
