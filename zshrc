# Install pure theme with `git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"`
fpath+=$HOME/.zsh/pure

autoload -U promptinit; promptinit
prompt pure

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
