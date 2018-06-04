autoload -Uz colors
colors

zmodload -i zsh/complist

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

# settings
setopt auto_remove_slash
unsetopt beep
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export KEYTIMEOUT=1

# completion settings
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
# ignore completion for non existing functions
zstyle ':completion:*:functions' ignored-patterns '_*'
# ignore parent on cd ..
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle :compinstall filename '/home/sahil.kabra/.zshrc'

autoload -Uz compinit
compinit

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
#zplug "modules/environment", from:prezto
zplug "modules/autosuggestions", from:prezto
# {{{
    zstyle ':prezto:module:autosuggestions' color 'yes'
    zstyle ':prezto:module:autosuggestions:color' found 'fg=red'
# }}}

export NVM_LAZY_LOAD=true
zplug "lukechilds/zsh-nvm"

# check if all plugins installed, else prompt to install
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Load zsh plugins
zplug load

bindkey -v                          # vi mode$

[ -f ${HOME}/.fzf.zsh ] && source ${HOME}/.fzf.zsh
[ -f ${HOME}/.cargo/env ] && source ~/.cargo/env

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# plugins used before, add if missed
# zplug "tomsquest/nvm-auto-use.zsh", from:github cannot use lazy load and auto use
# zplug "modules/git", from:prezto
# zplug "modules/gpg", from:prezto
# zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# zplug "docker/compose", use:contrib/completion/zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.sdkman.zsh ] && source ~/.sdkman.zsh

