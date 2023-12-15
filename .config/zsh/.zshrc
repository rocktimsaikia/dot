fpath+=$HOME/.config/zsh/.zfunc
autoload -Uz cgbuild cgcommit cgrelease

# This needs to be enabled inorder to use vcs_info_msg_0_
setopt PROMPT_SUBST

# Preload and enable vsc_info and stores data to vcs_info_msg_0_
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:*' formats ' %F{#4d4d51}(%b)%f'

# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
PS1='%F{red}% 󰊠 %f%S%F{#313244} %K{#f4a97f}%~%k %f%s$vcs_info_msg_0_ '
# #504945, #665c54, #a89984

source "$XDG_CONFIG_HOME/aliasrc"

# Loading package manager
source "$XDG_CONFIG_HOME/zsh/antigen.zsh"

# bindkey -v
bindkey -e
bindkey '\t' menu-complete
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

setopt nomenucomplete

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle hlissner/zsh-autopair

#zsh-you-should-use
export YSU_MESSAGE_POSITION="after"

#zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

antigen apply

# Added by n-install (see http://git.io/n-install-repo).
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

export LANG='en_US.UTF-8'

# bins
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/neovim/bin:$PATH"
export PATH="$HOME/.config/rofi/scripts:$PATH"
export PATH="$PATH:/usr/local/go/bin"

# To stop ranger from loading both the default and your custom rc.conf,
# please set the environment variable RANGER_LOAD_DEFAULT_RC to FALSE.
export RANGER_LOAD_DEFAULT_RC=false

# Bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"
# # Bun completions
# [ -s "/home/rocktim/.bun/_bun" ] && source "/home/rocktim/.bun/_bun"

export DENO_INSTALL="/home/rocktim/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Pyenv-Virtualenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv virtualenv-init -)"
fi

# RVM: Ruby Version Manager
# source "/etc/profile.d/rvm.sh"
# source ~/autoenv/activate.sh

# new pyenv configurations
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
