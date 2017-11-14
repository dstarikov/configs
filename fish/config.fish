fish_vi_key_bindings

export fish_color_host=yellow
export fish_color_user=purple
export fish_pager_color_progress=purple

set fish_greeting ""

alias sl='ls --color'
alias s='ls --color'
alias ls='ls --color'
alias rm='rm -I'
alias cp='cp -i'
alias wget='curl -O'
alias h='history | tail -n 3'

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

function x86
  echo '(x86)'
end
function X86
  echo '(X86)'
end
