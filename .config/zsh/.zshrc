# init prompt and pick pure
fpath+="$XDG_CONFIG_HOME/zsh/plugins/pure"
autoload -U promptinit; promptinit
zstyle :prompt:pure:git:stash show yes
prompt pure

source "$XDG_CONFIG_HOME/zsh/aliases"
source "$HOME/scripts/common.sh"
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
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/neovim/bin:$PATH"
