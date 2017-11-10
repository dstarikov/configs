fish_vi_key_bindings

SET fish_color_host:yellow
SET fish_color_user:purple
SET fish_pager_color_progress:purple

SET fish_greeting:""

alias sl='ls --color'
alias s='ls --color'
alias ls='ls --color'
alias rm='rm -I'
alias cp='cp -i'
alias wget='curl -O'
alias h='history | tail -n 3'

function x86
  echo '(x86)'
end
function X86
  echo '(X86)'
end
