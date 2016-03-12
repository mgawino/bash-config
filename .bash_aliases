# General
alias sudo='sudo '
alias rm='trash'
alias servedir='python -m SimpleHTTPServer'
alias c="clear"
alias chx='chmod 755'
# Alert for long running commands. Usage: sleep 10; alert
 alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Tar
extract() { 
    if [ -f $1 ] ; then 
      case $1 in 
        *.tar.bz2)   tar xjf $1     ;; 
        *.tar.gz)    tar xzf $1     ;; 
        *.bz2)       bunzip2 $1     ;; 
        *.rar)       unrar e $1     ;; 
        *.gz)        gunzip $1      ;; 
        *.tar)       tar xf $1      ;; 
        *.tbz2)      tar xjf $1     ;; 
        *.tgz)       tar xzf $1     ;; 
        *.zip)       unzip $1       ;; 
        *.Z)         uncompress $1  ;; 
        *.7z)        7z x $1        ;; 
        *)     echo "'$1' cannot be extracted via extract()" ;; 
         esac 
     else 
         echo "'$1' is not a valid file"
     fi
}

# Cd
alias ..="cd .."
alias ...="cd ../.."
mkcd() { mkdir -p "$1"; cd "$1";} 

# Ls
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tree='tree -C'

# Grep
alias grep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Mount
# Mount a temporary ram partition
alias mountram='mount -t tmpfs tmpfs /mnt -o size=1024m'

# Processes
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'
alias psgrep='ps auxf | grep'
# Intercept the stdout and stderr of a process
alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p" # PID

# System info
alias sysversion='lsb_release -rd'
alias meminfo='free -m -l -t -h'
alias cpuinfo='lscpu'
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# Network
alias myip='curl ifconfig.me/ip'
alias netstat='netstat -tulpena'
alias tcpick='tcpick -i any -yP -C'

# Git
alias gita='git add -A'
alias gitac='gita && git commit'
alias gitam='gita && git commit --amend --no-edit'
alias gitf='git fetch -p'
alias gitr='git rebase'
alias gitro='git rebase origin'
alias gitrc='git rebase --continue'
alias gitrs='git rebase --skip'
alias gitp='git push origin'
alias gitpdel='git push --delete origin'
alias gitbdel='git branch -D'
alias gits='git status'
alias gitd='git diff'
alias gitc='git checkout'
alias gitl='git lol'
alias gitla='git lola'

# Docker
alias docker-rmall='docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi $(docker images -q)'
alias docker-killall='docker kill $(docker ps -q)'
alias docker-ip='docker inspect -f "{{ .NetworkSettings.IPAddress }}"' #container
# enter last container
alias docker-ns='sudo nsenter --target $(docker inspect --format {{.State.Pid}} $(docker ps -ql)) --mount --uts --ipc --net --pid'
alias docker-run='docker run -it '
# docker exec last container
alias docker-exec='docker exec -it $(docker ps -ql)' #command to use
alias docker-clean='docker rmi $(docker images --filter dangling=true --quiet); docker rm $(docker ps -a | grep Exited | cut -d" " -f1)'
alias docker-rmuntagged='docker rmi $(docker images -a | grep "^<none>" | awk "{print \$3}")'
