# Welcome message
echo -ne "Good Morning,Dre! It's "; date '+%A, %B %-d %Y'
echo -e "And now your moment of Zen:"; fortune
echo
echo "Hardware Information:"
sensors  # Needs: 'sudo apt-get install lm-sensors'
uptime   # Needs: 'sudo apt-get install lsscsi'
free -m

sudo apt-get update && sudo apt-get upgrade 

if [ -f ~/.bash_aliases  ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.bash_functions  ]; then
	. ~/.bash_functions
fi

if [ -f ~/.docker_aliases ]; then
	. ~/.docker_aliases
fi

if [ -f ~/.docker_fuctions ]; then
	. ~/.docker_functions
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

export DISPLAY=:0
export PATH=$PATH:/usr/local/go/bin
