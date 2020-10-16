# Welcome message
echo "Welcome, Le Aundre! It's "; date '+%A, %B %-d %Y'
echo "And now your moment of Zen:"; fortune

echo "Hardware Information:"
sensors  # Needs: 'sudo apt-get install lm-sensors'
uptime   # Needs: 'sudo apt-get install lsscsi'
free -m

# shellcheck source=/home/leaundre/.bash_aliases
if [ -f ~/.bash_aliases  ]; then
	. ~/.bash_aliases
fi
# shellcheck source=/home/leaundre/.bash_functions
if [ -f ~/.bash_functions  ]; then
	. ~/.bash_functions
fi
# shellcheck source=/home/leaundre/.docker_aliases
if [ -f ~/.docker_aliases ]; then
	. ~/.docker_aliases
fi

env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Powerline configuration
if [ -f /usr/share/powerline/bindings/bash/powerline.sh  ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/bash/powerline.sh
fi

_spty_completion() {
    local IFS=$'
'
    COMPREPLY=( $( env COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   _SPTY_COMPLETE=complete $1 ) )
    return 0
}

_spty_completionetup() {
    local COMPLETION_OPTIONS=""
    local BASH_VERSION_ARR=(${BASH_VERSION//./ })
    # Only BASH version 4.4 and later have the nosort option.
    if [ ${BASH_VERSION_ARR[0]} -gt 4 ] || ([ ${BASH_VERSION_ARR[0]} -eq 4 ] && [ ${BASH_VERSION_ARR[1]} -ge 4 ]); then
        COMPLETION_OPTIONS="-o nosort"
    fi

    complete $COMPLETION_OPTIONS -F _spty_completion spty
}

_spty_completionetup;

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# Use colors for less, man, etc.
[[ -f ~/.config/less/termcap  ]] && . ~/.config/less/termcap

# Path Edits
export DISPLAY=:0
export PATH=$PATH:/home/leaundre/.local/bin
# Android Path
export ANDROID_HOME=~/Android
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="${ANDROID_HOME}/emulator:${PATH}"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

#Set Dart to Path
export PATH="$PATH:/usr/lib/dart/bin"

#Set Flutter to Path
export PATH="$PATH:/home/leaundre/development/flutter/bin"

# APIs for Checkip
export GEOIP_LICENSE_KEY='PH17xbVN3msULFaV'
export ABUSEIPDB_API_KEY='903ec1f58e0d32ab3bb713724184e57cf85e388ba2e4eda0ad5625a7f4921f0780fee82255eb76e3'
export VIRUSTOTAL_API_KEY='c98d978b966353ce705c10d0f14d1a991e41946d08c58bffaccf8c817b79ab0c'
# Docker Path
export DOCKER_HOST=tcp://localhost:2375
# For headless spotify usages
export SPOTIFY_USER='dj_megabytez'
export SPOTIFY_PWD='WyN7TM3Yt8EdRRM'
# GUI BROWSER
export BROWSER='"/mnt/c/Program Files/Mozilla Firefox/firefox.exe"'
#Adding Go to System Path
export PATH=$PATH:/usr/local/go/bin
export BW_SESSION='dlx0+OmsSU2Foo4FxzFILGlKx3tMHhFG1sSlyyZjL9r5lgk0oVNfG9DNmH+MEfPLZDSS9fzAtmj5MPwBMzklSQ=='

# shellcheck source=/home/leaundre/.fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH=$PATH:$HOME/.git-radar

# Get the current local IP address
export SERVER_IP='hostname -I'
