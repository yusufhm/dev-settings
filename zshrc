# Install oh-my-zsh: sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Move omz's created file: mv ~/.zshrc ~/.zshrc.oh-my-zsh.bak

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Install with `brew install kube-ps1`.
if [ -f /opt/homebrew/opt/kube-ps1/share/kube-ps1.sh ]; then
    source /opt/homebrew/opt/kube-ps1/share/kube-ps1.sh
    # Change bira theme's prompt.
    # See https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/bira.zsh-theme
    kube_ps1_prompt='$(kube_ps1)'
    PROMPT="╭─${user_host}${current_dir}${rvm_ruby}${vcs_branch}${venv_prompt}${kube_ps1_prompt}
╰─%B${user_symbol}%b "
fi

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

export PATH="/opt/homebrew/opt/python/bin:$HOME/go/bin:$HOME/Library/Python/3.10/bin:$PATH"

# Install with `curl -LO https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases`
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases

# Install with `brew install kubectx`
alias kctx="kubectx"
alias kns="kubens"
alias compose="docker compose"

eval "$(direnv hook zsh)"

command -v flux >/dev/null && . <(flux completion zsh)

export KUBECONFIG=$HOME/.kube/config

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yusuf/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yusuf/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yusuf/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yusuf/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Enable completion for kubebuilder.
command -v kubebuilder >/dev/null && . <(kubebuilder completion zsh)

if [ -f '/opt/homebrew/opt/asdf/libexec/asdf.sh' ]; then . /opt/homebrew/opt/asdf/libexec/asdf.sh; fi

if [ -f '$HOME/.asdf/asdf.sh' ]; then . $HOME/.asdf/asdf.sh; fi

# Fix for mouse scrolling in iterm2 with Secure Keyboard Entry enabled.
# See https://gitlab.com/gnachman/iterm2/-/issues/5863#note_93694055
export LESS="-R"

# Add global composer bins.
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
# export PATH="/Users/yusuf/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Flutter SDK
export PATH="$HOME/projects/flutter/bin:$PATH"

export-colima-ssh-auth-sock() {
  if [ ! -z "$(colima status 2>&1 | grep runtime)" ]; then
    export COLIMA_SSH_AUTH_SOCK=$(colima ssh env | grep SSH_AUTH_SOCK | cut -d = -f 2)
  fi
}
add-zsh-hook precmd export-colima-ssh-auth-sock

toggl-tempo-sync() {
  pushd ~/projects/toggl-tempo
  go run . ${@}
  popd
}

export PIPX_DEFAULT_PYTHON=/opt/homebrew/opt/python@3.11/libexec/bin/python
