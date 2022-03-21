alias ~="~ && ls"
alias ..=".. && ls"
alias agrp='alias G'
alias code='open -a /Applications/Visual\ Studio\ Code.app/'
alias eject='cd ~ && diskutil unmountDisk /Volumes/UNTITLED && echo 🧑‍🚒'
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
alias gpom='git pull origin $(git_main_branch)'
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
alias ip='ipconfig getifaddr en0'
alias nrd='npm run dev'
alias ns='npm start'
alias nv='nvim'
alias os='sudo cu -s 115200 -l /dev/tty.usbserial'
alias old-os='screen -L /dev/cu.usbserial 115200 –L'
alias show-usb='ls /Volumes/UNTITLED'
alias sls='screen -ls'
alias sx='screen -x'
alias sxq='screen -X quit'
alias sz='source ~/.zshrc'
alias usb='cd /Volumes/UNTITLED && ls'
alias v='vim'
alias va='vim ~/github/dotfiles/aliases.zsh'

# JAVA
alias all-java='/usr/libexec/java_home -V'
alias highest-java='/usr/libexec/java_home'

# gradle
alias gres='open -a /Applications/Google\ Chrome.app app/build/reports/tests/test/index.html'
alias grun='./gradlew run'
alias gtest='gradle test'

## switch java versions (not needed yet, since java 11 became default after installation)
# export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
# export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
# alias java8='export JAVA_HOME=$JAVA_8_HOME'
# alias java11='export JAVA_HOME=$JAVA_11_HOME'
#
# ## default to Java 11
# java11

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
dka () {
  dk && dk
  Y docker network prune
  Y docker volume prune
}
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
alias caps='cpair -A production ssh'
alias cas='cpair -A sandbox'
alias casc='cas c && cas s'
alias casl='cas l'
alias cass='cas s'
alias cassp='cas s -p'
alias casdp='Y cas d -p'
alias css='cd ~/bt/cpair-setup-script'

# functions
cascp() { cas c -p $1 && cassp $1 }
ccp() { cpair c -p $1 && cpair s -p $1 }
copy-from-cpair() { cpair scp :/home/admin/bt/in-store/target/dist/Braintree-$1.tgz . -p $2 }
copy-signed-from-cpair() { cpair scp :/home/admin/bt/in-store/target/dist/Braintree-$1-SIGNED.tgz . -p $2 }
copy-to-cpair() { cpair scp $1 :~/ -p $2 } # copies file to /home/dharbor
copy-to-usb () { cp $1 /Volumes/UNTITLED }

## Maven (https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html)
# create a new mvn app (arg: app_name)
create-mvn-app() {
  mvn archetype:generate -DgroupId=com.daito.app -DartifactId=$1 -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false;
  echo "$(tput setaf 6)Message from daito: Don't forget to run the 'Java 9 or later' steps at https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html#java-9-or-later$(tput sgr 0)"
}

encode() { echo "$1" | base64 }
decode() { echo "$1" | base64 -d }
gstaap() { git stash apply stash@{$1} }
gsshp() { git stash show stash@{$1} }
gstdp() { git stash drop stash@{$1} }
gstpp() { git stash pop stash@{$1} }
gstsp() { git stash show --text stash@{$1} }
gstst () { git stash push -m "${@:1}" -- $(git diff --staged --name-only) }
j() { javac $1 && java ${1%.*} }
lcd () { cd "${@:1}" && ls; }

load-usb() {
  export $(cat ~/bt/in-store/target/dist/signing.env | xargs)
  cp ~/bt/in-store/target/dist/Braintree-$BRAINTREE_VERSION-SIGNED.tgz /Volumes/UNTITLED
  eject
}

load-reader() {
  python3 ~/bt/in-store/tools/netloader/netloader.py -ip 192.168.86.$2 -cl $1
  if [ $? -eq 0 ]; then
    say -v Daniel upload complete
  else
    say -v Daniel pull failed
  fi
}

mcd () { mkdir $1 && cd $1; }
# run maven app
mvn-run() { java -cp target/${PWD##*/}-1.0-SNAPSHOT.jar com.daito.app.App }
# maven package and run
mvn-par() { mvn package && mvn-run }

pas() {
  cd ~/bt/in-store
  ./pull_from_cpair_and_sign.sh $1
  if [ $? -eq 0 ]; then
    load-usb && say -v Daniel signed || say -v Daniel insert usb
  else
    say -v Daniel pull failed
  fi
}

pau() {
  cd ~/bt/in-store
  ./pull_from_cpair_and_upload.sh $1 192.168.86.$2
  if [ $? -eq 0 ]; then
    say -v Daniel upload complete
  else
    say -v Daniel pull failed
  fi
}

tnet () { telnet 192.168.86.$1 }
touchopen () { touch $1 && vim $1; }
