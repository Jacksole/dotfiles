# Bash alias to search through history with speed accuracy
alias hs='history | grep'
alias ll='ls -lha'
alias ls='ls -CF'
# Sort by file size
alias lt='ls --human-readable --size -1 -S --classify'
# Sort by modification time
alias left='ls -t -1'
# Count files
alias count='find . -type f | wc -l'
# Create a Python virtual environment
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
# Add a copy progess bar
alias cpv='rsync -ah --info=progress2'
alias sl="ls"
alias lsl="ls -lhFA | less"
alias cd..="cd .."
alias ..='cd ..'
alias fhere="find . -name"
alias df="df -Tha --total"
alias du="du -ach | sort -h"
alias free="free -mt"
alias ps="ps auxf"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias mkdir="mkdir -pv"
alias wget="wget -c"
alias top="htop"
alias top="htop"
alias df="pydf"
alias myip="curl http://ipecho.net/plain; echo"
alias webify="mogrify -resize 690\> *.png"
alias upload="sftp username@server.com:/path/to/upload/directory"
# ----------------------
# Git Aliases
# ----------------------
alias cg='cd `git rev-parse --show-toplevel`'
alias g='git'
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'
alias startgit='cd `git rev-parse --show-toplevel` && git checkout master && git pull'
#---------------------------------
# Bash Maintenance
#--------------------------------
alias aclean='sudo apt autoclean'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias remove='sudo apt autoremove'
alias clean='sudo apt-get clean'
# Edit .bashrc
alias bashedit='sudo vim ~/.bashrc'

# Force terminal to recognize changes to .bashrc
alias bashrefresh='source ~/.bashrc'
#-------------------------------
# Time Management
#-------------------------------
alias pomodorostrt='sleep 1500 && notify-send "Your pomodoro session just ended. Have a well deserved 5 minutes break"'
alias pomodorobrk='sleep 300 && notify-send "Back to work"'
alias pomodoro='pomodorostrt; pomodorobrk' 
#--------------------------------
# Python Aliases
#--------------------------------
alias jupyter-notebook="~/.local/bin/jupyter-notebook --no-browser"
alias pyoutdated='python3 -m pip list --outdated'
#------------------------------
# File Management
#------------------------------
alias mv='mv -i'
alias rm='rm -i'
alias tcn='mv --force -t ~/.local/share/Trash' 
#-------------------------------
# Folder Management
#------------------------------
alias mkdir="mkdir -pv"
