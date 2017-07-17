zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'r:|[._-]=* r:|=*' '' 'l:|=* r:|=*'
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion::complete:*' use-cache on  # completion cache
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # colorz
zstyle :compinstall filename '/Users/sahil/.zshrc'

autoload -Uz colors
colors

autoload -Uz compinit
compinit
zmodload -i zsh/complist

autoload -Uz promptinit
promptinit
prompt redhat

# History
HISTFILE=~/.zsh_history
HISTSIZE=1024                       # big history
SAVEHIST=1024                       # big history
setopt appendhistory                # append to history
setopt hist_ignore_all_dups         # ignore duplicates
setopt hist_reduce_blanks           # trim blanks
setopt hist_verify                  # verify before executing commands
setopt inc_append_history           # add commands as they are typed
setopt share_history                # share history between sessions
bindkey -e

# settings
setopt auto_remove_slash
unsetopt beep
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

if [[ -z "${LANG}" ]]; then
    export LANG='en_US.UTF-8'
fi

# Source files
if [[ -f ${HOME}/.aliases ]]; then
    emulate sh -c '. ${HOME}/.aliases'
fi

if [[ -f ${HOME}/.exports ]]; then
    emulate sh -c '. ${HOME}/.exports'
fi

if [[ -f ${HOME}/.aliases-work ]]; then
    emulate sh -c '. ${HOME}/.aliases-work'
fi
if [[ -f ${HOME}/.exports-work ]]; then
    emulate sh -c '. ${HOME}/.exports-work'
fi

# zplug commands
# install zplug if not available
ZPLUG_HOME=${ZPLUG_HOME:-${HOME}/.zplug}
if [[ ! -d ${ZPLUG_HOME} ]]; then
    git clone https://github.com/zplug/zplug ${ZPLUG_HOME}
fi

source ${ZPLUG_HOME}/init.zsh

zplug "mafredri/zsh-async", from:github
# Pure Prompt
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "modules/environment", from:prezto
zplug "modules/autosuggestions", from:prezto
zstyle ':prezto:module:autosuggestions' color 'yes'
zstyle ':prezto:module:autosuggestions:color' found 'fg=red'

export NVM_LAZY_LOAD=true
zplug "lukechilds/zsh-nvm"
# load nvm based on nvm rc
# autoload -U add-zsh-hook
# load-nvmrc() {
#  local node_version="$(nvm version)"
#  local nvmrc_path="$(nvm_find_nvmrc)"
#
#  if [ -n "$nvmrc_path"]; then
#    local nvmrc_node_version = $(nvm version "$(cat "${nvmrc_path}")")
#
#    if [ "$nvmrc_node_version" = "N/A" ]; then
#      nvm install
#    elif [ "$nvmrc_node_version" != "$node_version" ]; then
#      nvm use
#    fi
#  fi
#}
#add-zsh-hook chpwd load-nvmrc

zplug "docker/compose", use:contrib/completion/zsh

# check if all plugins installed, else prompt to install
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Load zsh plugins
zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


# plugins used before, add if missed
# zplug "modules/git", from:prezto
# zplug "modules/gpg", from:prezto
# zplug 'zplug/zplug', hook-build:'zplug --self-manage'
