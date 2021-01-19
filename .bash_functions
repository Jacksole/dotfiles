function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

# Git

gf() {
   CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
   git add . && git commit -m "$1" && git push origin "$CURRENT_BRANCH"

}

gfr() {
    git reset @~ "$@" && git commit --amend --no-edit

}

gswitch() {
  BRANCH=`git branch | grep "$1"`
  git checkout $BRANCH

}

# Get the latest changes on master pulled down locally
# and then rebase them into/onto the current branch
grm() {
  CURRENT=`git rev-parse --abbrev-ref HEAD` # figures out the current branch
  git checkout master
  git pull
  git checkout $CURRENT
  git rebase master

}

# Stash current, then update to latest, then pop the stash
gsrm() {
  git stash
  grm
  git stash pop

}

# create new branch from a default named branch
# modify the first line to make it an argument if desired
gnew() {
 DEST_BRANCH=$2
 : ${DEST_BRANCH:='master'}
 git co $DEST_BRANCH
 git pull
 git co -b "$1"
 # bundle install # If using Bundler (ruby)
 # bundle exec rake db:migrate
 git push -u

}

function git_clean_untracked_safely {
  TO_REMOVE=`git clean -f -d -n`;
  if [[ -n "$TO_REMOVE" ]]; then
    echo "Cleaning...";
    printf "\n$TO_REMOVE\n\n";
    echo "Proceed?";

    select result in Yes No; do
      if [[ "$result" == "Yes" ]]; then
        echo "Cleaning in progress...";
        echo "";
        git clean -f -d;
        echo "";
        echo "All files and directories removed!";
      fi
      break;
    done;
  else
    echo "Everything is clean";
  fi;
}

function git_clean_local_branches {
  OPTION="-d";
  if [[ "$1" == "-f" ]]; then
    echo "WARNING! Removing with force";
    OPTION="-D";
  fi;

  TO_REMOVE=`git branch -r | awk "{print \\$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \\$1}"`;
  if [[ -n "$TO_REMOVE" ]]; then
    echo "Removing branches...";
    echo "";
    printf "\n$TO_REMOVE\n\n";
    echo "Proceed?";

    select result in Yes No; do
      if [[ "$result" == "Yes" ]]; then
        echo "Removing in progress...";
        echo "$TO_REMOVE" | xargs git branch "$OPTION";
        if [[ "$?" -ne "0" ]]; then
          echo ""
          echo "Some branches was not removed, you have to do it manually!";
        else
          echo "All branches removed!";
        fi
      fi

      break;
    done;
  else
    echo "You have nothing to clean";
  fi
}

# NVM
cdnvm(){
    cd "$@";
    nvm_path=$(find-up .nvmrc | tr -d '[:space:]')

    # If there are no .nvmrc file, use the default nvm version
    if [[ ! $nvm_path = *[^[:space:]]* ]]; then

        declare default_version;
        default_version=$(nvm version default);

        # If there is no default version, set it to `node`
        # This will use the latest version on your machine
        if [[ $default_version == "N/A" ]]; then
            nvm alias default node;
            default_version=$(nvm version default);
        fi

        # If the current version is not the default version, set it to use the default version
        if [[ $(nvm current) != "$default_version" ]]; then
            nvm use default;
        fi

        elif [[ -s $nvm_path/.nvmrc && -r $nvm_path/.nvmrc ]]; then
        declare nvm_version
        nvm_version=$(<"$nvm_path"/.nvmrc)

        declare locally_resolved_nvm_version
        # `nvm ls` will check all locally-available versions
        # If there are multiple matching versions, take the latest one
        # Remove the `->` and `*` characters and spaces
        # `locally_resolved_nvm_version` will be `N/A` if no local versions are found
        locally_resolved_nvm_version=$(nvm ls --no-colors "$nvm_version" | tail -1 | tr -d '\->*' | tr -d '[:space:]')

        # If it is not already installed, install it
        # `nvm install` will implicitly use the newly-installed version
        if [[ "$locally_resolved_nvm_version" == "N/A" ]]; then
            nvm install "$nvm_version";
        elif [[ $(nvm current) != "$locally_resolved_nvm_version" ]]; then
            nvm use "$nvm_version";
        fi
    fi

}

function gig() { curl -sL https://www.toptal.com/developers/gitignore/api/\$@ ; }

function edit {
  vim "$1"

}

# Python
function pyupdate {
  python3 -m pip install -U -r "$1"

}


# Folder Navigation

function mnt {
  "mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3;  }' | column -t | egrep ^/dev/ | sort"

}

function mcd () {
    mkdir -pv $1
    cd $1
}

function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1  ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -F --color=auto

}

function find-up () {
    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
        path=${path%/*}
    done
    echo "$path"

}

function up {
  num=$1
  while [ $num -ne 0   ];do
    cd ..
    num=$((num-1))
  done

}

# Updating via root
function apt-updater {
  apt-get update &&
  apt-get dist-upgrade -Vy &&
  apt-get autoremove -y &&
  apt-get autoclean &&
  apt-get clean &&
  reboot
}

# Docker
function dkln(){
  docker logs -f 'docker ps | grep $1 | awk '{print $1}''
}

function dkstats(){
if [ $# -eq 0 ]
   then docker stats --no-stream;
   else docker stats --no-stream | grep $1;
fi
}

function  dktop() {
  docker stats --format "table {{.Container}}\t{{.Name}}\t{{.CPUPerc}} {{.MemPerc}}\t{{.NetID}}\t{{.BlockID}}"
}

function dkp() {
  if [ ! -f .dockerignore  ]; then
    echo "Warning, .dockerignore file is missing."
    read -p "Proceed anyway?"
  fi

  if [ ! -f package.json  ]; then
    echo "Warning, package.json file is missing."
    read -p "Are you in the right directory?"
  fi

  VERSION=`cat package.json | jq .version | sed 's/\"//g'`
  NAME=`cat package.json | jq .name | sed 's/\"//g'`
  LABEL="$1/$NAME:$VERSION"

  docker build --build-arg NPM_TOKEN=${NPM_TOKEN} -t $LABEL .

  read -p "Press enter to publish"
  docker push $LABEL

}

function dkpnc() {
  if [ ! -f .dockerignore  ]; then
    echo "Warning, .dockerignore file is missing."
    read -p "Proceed anyway?"
  fi

  if [ ! -f package.json  ]; then
    echo "Warning, package.json file is missing."
    read -p "Are you in the right directory?"
  fi

  VERSION=`cat package.json | jq .version | sed 's/\"//g'`
  NAME=`cat package.json | jq .name | sed 's/\"//g'`
  LABEL="$1/$NAME:$VERSION"

  docker build --build-arg NPM_TOKEN=${NPM_TOKEN} --no-cache=true -t $LABEL .
  read -p "Press enter to publish"
  docker push $LABEL

}

function dkpl() {
  if [ ! -f .dockerignore  ]; then
    echo "Warning, .dockerignore file is missing."
    read -p "Proceed anyway?"
  fi

  if [ ! -f package.json  ]; then
    echo "Warning, package.json file is missing."
    read -p "Are you in the right directory?"
  fi

  VERSION=`cat package.json | jq .version | sed 's/\"//g'`
  NAME=`cat package.json | jq .name | sed 's/\"//g'`
  LATEST="$1/$NAME:latest"

  docker build --build-arg NPM_TOKEN=${NPM_TOKEN} --no-cache=true -t $LATEST .
  read -p "Press enter to publish"
  docker push $LATEST

}
# docker-clean command cleans up all dangling images

function dkclean() {
  docker rmi $(docker ps --all -q -f status=exited)
  docker volume rm $(docker volume ls -qf dangling=true)

}

function dkprune() {
  docker system prune -af

}

function dpurgeall(){
  docker --rm -v $(docker ps -a -q -f status=exited);
  docker volume --rm $(docker volume ls -qf dangling=true);
  docker image --rm $(docker images -qf dangling=true);

}

function dkstats() {
  if [ $# -eq 0  ]
    then docker stats --no-stream;
    else docker stats --no-stream | grep $1;
  fi

}

function dke() {
  docker exec -it $1 /bin/sh

}

function dkexe() {
  docker exec -it $1 $2

}

function dkreboot() {
  osascript -e 'quit app "Docker"'
  countdown 2
  open -a Docker
  echo "Restarting Docker engine"
  countdown 120

}

function dkstate() {
  docker inspect $1 | jq .[0].State

}

function dksb() {
  docker service scale $1=0
  sleep 2
  docker service scale $1=$2

}

function dk_mongo() {
  mongoLabel=`docker ps | grep mongo | awk '{print $NF}'`
  docker exec -it $mongoLabel mongo "$@"

}

function dk_redis() {
  redisLabel=`docker ps | grep redis | awk '{print $NF}'`
  docker exec -it $redisLabel redis-cli

}

function dm-env() {
	  eval "$(docker-machine env "${1:-default}")"

}

function tail_ls { ls -l "$1" | tail;  }

function traceroute-mapper {
	  wslview "https://stefansundin.github.io/traceroute-mapper/?trace=$(traceroute -q1 $* | sed ':a;N;$!ba;s/\n/%0A/g')"

}
