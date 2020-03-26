# @see https://sanctum.geek.nz/arabesque/better-bash-history/
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
PROMPT_COMMAND='history -a'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias python=/usr/local/bin/python3

alias pip=/usr/local/bin/pip3

export PS1='$ '

alias local_server_start='
    brew services start mariadb &&
    brew services start memcached &&
    sudo brew services start httpd &&
    sudo brew services start dnsmasq &&
    brew services start mailhog
'
alias local_server_stop='
    brew services stop mailhog &&
    sudo brew services stop dnsmasq &&
    sudo brew services stop httpd &&
    brew services stop memcached &&
    brew services stop mariadb
'

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

alias ve='vagrant exec'

export PATH="/usr/local/sbin:$PATH"

export PATH="$PATH:/Users/yhasanmiyan/Library/Application Support/KomodoIDE/12.0/XRE/state" # ActiveState State Tool
