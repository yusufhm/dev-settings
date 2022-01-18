# Install oh-my-zsh: sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Move omz's created file: mv ~/.zshrc ~/.zshrc.oh-my-zsh.bak

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"
plugins=(git)
source $ZSH/oh-my-zsh.sh

setopt histignorealldups sharehistory

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Alias for freeing cache in WSL2.
alias wsl_drop_cache="sudo sh -c \"echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'\""

export ITERM2_SQUELCH_MARK=1
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/go/bin:/opt/homebrew/opt/python/bin:$HOME/Library/Python/3.9/bin:$PATH"

alias kubegov3="kubectl --context=arn:aws:eks:ap-southeast-2:863998171688:cluster/amazeeio-govcms3"
alias kubegov5="kubectl --context=arn:aws:eks:ap-southeast-2:863998171688:cluster/amazeeio-govcms5"
alias kubegov6="kubectl --context=arn:aws:eks:ap-southeast-2:863998171688:cluster/amazeeio-govcms6"
alias kubegov7="kubectl --context=arn:aws:eks:ap-southeast-2:863998171688:cluster/amazeeio-govcms7"
alias kubegov9="kubectl --context=arn:aws:eks:ap-southeast-2:863998171688:cluster/amazeeio-govcms9"

eval "$(direnv hook zsh)"

