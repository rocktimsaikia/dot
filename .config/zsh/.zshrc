fpath+=$HOME/.config/zsh/.zfunc
autoload -Uz cgbuild cgcommit cgrelease

# This needs to be enabled inorder to use vcs_info_msg_0_
setopt PROMPT_SUBST

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

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

eval "$(starship init zsh)"

# Checks if the current dir contains any venv and activates on cd
function activatevenv() {
	if [[ -d "$PWD/venv" ]]; then
		source "$PWD/venv/bin/activate"
	fi
}

function cd() {
	builtin cd $1
	activatevenv
}

# pnpm
export PNPM_HOME="$HOME/.config/local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
