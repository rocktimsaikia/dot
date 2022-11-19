# Custom functions
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
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/neovim/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "/home/rocktim/.bun/_bun" ] && source "/home/rocktim/.bun/_bun"
