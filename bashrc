# @see https://sanctum.geek.nz/arabesque/better-bash-history/
# The following lines might need to be copied directly to ~/.bashrc
# Run `echo $HISTFILESIZE` to check that they're being applied.
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
PROMPT_COMMAND='history -a'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#export PS1='$ '

export PATH="$PATH:/usr/local/sbin:/usr/local/go/bin:$HOME/go/bin"

# Install bash-it (https://bash-it.readthedocs.io/en/latest/installation/).
# Theme: zork

# Aliases
alias dps='docker ps'
alias dcp='docker-compose'

alias kubegov1="kubectl --kubeconfig $HOME/.kube/config-govcms-openshift"
alias kubegov3="kubectl --kubeconfig $HOME/.kube/config-amazeeio-govcms3"
alias kubegov5="kubectl --kubeconfig $HOME/.kube/config-amazeeio-govcms5"
alias kubegov6="kubectl --kubeconfig $HOME/.kube/config-amazeeio-govcms6"
