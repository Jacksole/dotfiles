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

# Tmux

function kts {
  tmux kill-session -t "$1"

}

function tmnew {
  tmux new -s "$1"

}

function tmattach {
  tmux a -t "$1"

}

function edit {
  vim "$1"

}

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
