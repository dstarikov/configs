# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' insert-unambiguous true
# Highlight the current autocomplete option
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

zmodload zsh/complist
setopt menucomplete
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' rehash true
zstyle :compinstall filename '/home/starikov/.zshrc'
zstyle ':completion:*' menu select

# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# Allow for autocomplete to be case insensitive
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
  '+l:|?=** r:|?=**'


source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(completion history)

# Initialize the autocompletion
autoload -Uz compinit
compinit -i
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install

# Better searching in command mode
bindkey '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-search
bindkey -M vicmd "j" down-line-or-search

# ctrl-j/k up/down in insert mode
bindkey -M viins "^J" down-line-or-search
bindkey -M viins "^K" up-line-or-search

export KEYTIMEOUT=1

bindkey -v
bindkey -M vicmd '^[' undefined-key
bindkey -rM viins '^X'
bindkey -M viins '^X,' _history-complete-newer \
                 '^X/' _history-complete-older \
                 '^X`' _bash_complete-word

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Make backspace work as expected
bindkey "^?" backward-delete-char

# Disable bell sound
unsetopt BEEP

autoload -U promptinit; promptinit
prompt pure

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# (cat ~/.cache/wal/sequences &)
(wal -q -e -n --theme base16-spacemacs &)

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

alias cat='bat'
alias ls='ls --color=auto'

# Enable conda support
# [ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
