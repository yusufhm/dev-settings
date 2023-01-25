# Install oh-my-zsh: sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Move omz's created file: mv ~/.zshrc ~/.zshrc.oh-my-zsh.bak

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Install with `brew install kube-ps1`.
if [[ -f /opt/homebrew/opt/kube-ps1/share/kube-ps1.sh ]]; then
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

export PATH="$HOME/go/bin:/opt/homebrew/opt/python/bin:$HOME/Library/Python/3.10/bin:$PATH"

# Install with `curl -LO https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases`
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases

# Install with `brew install kubectx`
alias kctx="kubectx"
alias kns="kubens"

alias kgov3="kubectl --context=amazeeio-govcms3"
alias kgov4="kubectl --context=amazeeio-govcms4"
alias kgov5="kubectl --context=amazeeio-govcms5"
alias kgov6="kubectl --context=amazeeio-govcms6"
alias kgov7="kubectl --context=amazeeio-govcms7"
alias kgov9="kubectl --context=amazeeio-govcms9"
alias kkurnik="kubectl --kubeconfig=/Users/yusuf/projects/server-ops/.kubeconfig/kurnik.yaml"
alias ksalsa="kubectl --kubeconfig=$HOME/.kube/config-salsa-hosting"

eval "$(direnv hook zsh)"

command -v flux >/dev/null && . <(flux completion zsh)

export KUBECONFIG=$HOME/.kube/config:$HOME/.kube/config-amazeeio-sdp:$HOME/.kube/config-salsa-hosting:$HOME/projects/server-ops/.kubeconfig/izmir.yaml:$HOME/projects/server-ops/.kubeconfig/kurnik.yaml

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

if [ -d "$HOME/.local/bin" ]; then export PATH="$HOME/.local/bin:$PATH"; fi
