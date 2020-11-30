# Install pure theme with `git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"`
fpath+=$HOME/.zsh/pure

autoload -U promptinit; promptinit
prompt pure

export HISTFILESIZE=100000
export HISTSIZE=100000
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
