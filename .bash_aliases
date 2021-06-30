# Bash alias to search through history with speed accuracy
alias hs='history | grep'
alias ll='exa -lrF --git --icons'
alias l='ls -CF'
alias la='ls -A'
alias ls='exa'
# Sort by file size
alias lt='ls --human-readable --size -1 -S --classify'
# Sort by modification time
alias left='ls -t -1'
# Count files
alias count='find . -type f | wc -l'
# Add a copy progess bar
alias cpv='rsync -ah --info=progress2'
alias lsl="ls -lhFA | less"
alias cd..="cd .."
alias projects='pushd ~/Projects && clear && ls'
alias x="clear && ls"
alias ..="cd .. && clear && ls"
alias ...="cd ../.. && clear && ls"
alias ....="cd ../../.. && clear && ls"
alias ....="cd ../../../..&&  clear && ls"
alias fhere="find . -name"
alias df="df -Tha --total"
alias du="du -ach | sort -h"
alias free="free -mt"
alias ps="ps auxf"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias wget="wget -c"
alias top="htop"
alias top="htop"
alias df="pydf"
alias myip="curl http://ipecho.net/plain; echo"
alias webify="mogrify -resize 690\> *.png"
alias cls='clear'
alias ftc='ls | rev | cut -d '.' -f1 | rev | sort | uniq -c'
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
alias gca='git commit -a'
alias gca!='git commit -a --amend'
alias gcf='git commit --fixup'
alias gcl='git clone'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gd='git diff'
alias gda='git diff HEAD'
alias gdc='git diff --cached'
alias gfe='git fetch'
alias ggrh='git reset --hard origin/$(current_branch'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gpl='git pull'
alias gplO='git pull origin $(git name-rev --name-only HEAD)'
alias gps='git push'
alias gpsO='git push origin $(git name-rev --name-only HEAD)'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbiom='git rebase --interactive origin/master'
alias gs='git status'
alias gsh='git show'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'
alias startgit='cd `git rev-parse --show-toplevel` && git checkout master && git pull'
alias branch='git branch | grep -v "^\*" |fzf --height=20% --reverse --info=inline | xargs git co'
#---------------------------------
# Bash Maintenance
#--------------------------------
alias aclean='sudo apt autoclean'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias remove='sudo apt autoremove'
alias clean='sudo apt-get clean'
alias install='sudo apt-get install'
# Edit .bashrc
alias bashedit='sudo vim ~/.bashrc'
alias dc='cd'
# Force terminal to recognize changes to .bashrc
alias bashrefresh='source ~/.bashrc'
#-------------------------------
# Time Management
#-------------------------------
alias pomodorostrt='sleep 1500 && notify-send "Your pomodoro session just ended. Have a well deserved 5 minutes break"'
alias pomodorobrk='sleep 300 && notify-send "Back to work"'
alias pomodoro='pomodorostrt; pomodorobrk'
#--------------------------------
# Program Aliases
#--------------------------------
alias jupyter-notebook="~/.local/bin/jupyter-notebook --no-browser"
alias pyoutdated='python3 -m pip list --outdated'
alias pyinstall='python3 -m pip install'
alias pyuninstall='python3 -m pip uninstall'
alias pycheck='python3 -m pip check'
  # Create a Python virtual environment
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
alias py3='python3'
# Node Package Manager
alias npmg='npm install --global'
alias npmS='npm install --save'
alias npmD='npm install --save-dev'
alias npmO='npm outdated'
alias npmU='npm update'
alias npmL='npm list'
alias npmL0='npm list --depth=0'
alias npmst='npm run start'
alias npmt='npm run test'
alias npmR='npm run'
alias npmI='npm init'
# Command line alias to start the browser-sync server
alias serve="browser-sync start --server --files ."
#------------------------------
# File Management
#------------------------------
alias mv='mv -i'
alias mkdir="mkdir -pv"
alias rm='rm -i'
alias tcn='mv --force -t ~/.local/share/Trash'
# install  colordiff package :)
alias diff='colordiff'
alias cp='cp -i'
alias ln='ln -i'
alias n='nnn -d -e'
# Sort by file size
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
# Pane Management
alias tmls='tmux ls'
#-------------------------------
# Folder Management
#------------------------------
alias mkdir="mkdir -pv"
# Alias for pushd
alias pd="pushd"
# Alias for popd
alias p="popd"
# Alias for bin directory
alias bin="pushd ~/bin"
#------------------------------
# Database Management
#------------------------------
alias pgstart='sudo service postgresql start'
alias pgstop='sudo service postgresql stop'
alias pgrestart='sudo service postgresql restart'
alias pgstats='sudi service postgresql status'
alias runpg='sudo -u postgres psql'
alias mysqlstart='sudo service mysql start'
alias mysqlstop='sudo service mysql stop'
alias mysqlrestart='sudo service mysql restart'
alias mysqlstats='sudo service mysql status'
alias mysqlrun='sudo mysql'
alias redstart='sudo service redis start'
alias redstop='sudo service redis stop'
alias redrestart='sudo service redis restart'
alias rcli='sudo redis-cli'
#------------------------------
# Web Server
#------------------------------
alias apstart='sudo service apache start'
alias apstop='sudo service apache stop'
alias aprestart='sudo service apache restart'
alias apstats='sudo service apache status'
alias server='python3 -m SimpleHTTPServer 8000'
alias upload="sftp username@server.com:/path/to/upload/directory"
#-------------------------------
# Misc
#-------------------------------
alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'
alias define='googler -n 2 define'
alias cat=bat
# WSLU
alias view='wslview'
# Browser
alias firefox='/mnt/c/Program Files/Mozilla Firefox/firefox.exe'
alias chrome='/mnt/c/Program Files (x86)/Google Chrome/Application/chrome.exe'
# Covid Watch
alias covid='curl -L covid19.trackercli.com'
alias usa='curl -L covid19.trackercli.com/usa'
# Metadata Extraction
alias exiftool='/opt/tools/Image-ExifTool-12.25/exiftool'
# Stocks Listing
alias stonks='~/Projects/Programming/Go_Projects/stonks/stonks'
# Gobuster
alias gobuster='/home/leaundre/go/bin/gobuster'
## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias bc='bc -l'
alias now='date +"%T"'
alias note='vim $HOME/Notes/$(date +%Y-%m-%d_%H:%M.txt)'
alias nowtime='now'
alias nowdate='date +"%d-%m-%Y"'
alias weather='curl wttr.in'
alias crypto='curl rate.sx'
alias moon='curl wttr.in/moon'
alias cht='~/bin/cht.sh'
alias checkip='/opt/tools/checkip-linux-amd64'
alias bw='~/bw'
alias lookup='dict -d gcide $'
#------------------------------
# Networking
#------------------------------
# Nmap Shortcut
alias nmap='pwsh.exe -c nmap'
# Wireshark
alias wireshark='pwsh.exe -c start wireshark'
# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'
alias ports='netstat -tulanp'
## shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'
# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall='iptlist'
# get web server headers #
alias header='curl -I'
# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'
# RustScan
alias rustscan='docker run -it --rm --name rustscan rustscan/rustscan'
# WpScan
alias wpscan='docker run -it --rm wpscanteam/wpscan'
# Hacking aliases
alias impacket='docker run -it --rm "impacket:latest" '
alias gitdork='docker run -it gitdorker'
alias zap='/home/leaundre/ZAP_2.9.0/zap.sh'
alias hashcat="pwsh.exe -c 'C:\Users\ljack099\hashcat-6.1.1\hashcat.exe'"
alias ssh2john='sudo python3 /opt/tools/ssh2john.py'
alias xss='sudo python3 /opt/tools/XSSscan.py'
alias sqid='sudo ruby /opt/tools/sqid.rb'
alias wfuzz='docker run -v $(pwd)/wordlist:/wordlist/ -it ghcr.io/xmendez/wfuzz wfuzz'
alias sqlmap='python3 /opt/tools/sqlmap-dev/sqlmap.py'
alias volatility='python3 /opt/tools/volatility3/vol.py'
alias smbmap='python3 /opt/smbmap/smbmap.py'
# OSINT Alias
alias skiptrace='docker run -it --name skiptracer xshuden/skiptracer'
alias cloud_enum='/opt/tools/cloud_enum/cloud_enum.py'
alias enum_linux='/opt/tools/enum4linux-0.9.0/enum4linux.pl'
alias sherlock='sudo python3 /opt/tools/OSINT/sherlock/sherlock/sherlock.py --timeout 1'
# DNS searching
alias sublist3r='sudo python3 /opt/Sublist3r/sublist3r.py'
# Scanning for Vulnerable printers
alias printscan='python ~/Projects/Github/ctf/thme/Printer\Hacking\101/PRET/pret.py'
# Reverse Engineering
alias ghidra='/opt/tools/ghidra_9.2.2_PUBLIC/ghidraRun'
#------------------------------
## Windows executables:
#------------------------------
alias explore='explorer.exe .'
alias news='newsboat'
alias pods='podboat'
alias vlc='"/mnt/c/Program Files/VideoLAN/VLC/vlc.exe"'

## youtube-dl
alias ytdl='youtube-dl'
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "
