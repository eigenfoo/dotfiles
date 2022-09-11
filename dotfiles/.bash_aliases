# misc.
alias q='exit'
alias c='clear'

# cd
alias ~='cd ~'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# ls
if command -v exa &> /dev/null
then
    alias ls='exa -GF'
    alias la='exa -aGF'
    alias ll='exa -lGF'
    alias l='exa -laghFG'
else
    alias ls='ls -GF'
    alias la='ls -aGF'
    alias ll='ls -lGF'
    alias l='ls -laghFG'
fi

# rm
alias rm='rm -i'

# disk
alias df='df -H'
alias du='du -ch'

# activate venvs
alias svba='source venv/bin/activate'

# Add an "alert" alias for long running commands.  Use like so: 
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if command -v fzf &> /dev/null; then
    alias vimf='vim $(fzf)'
fi

# macvim
if command -v mvim &> /dev/null
then
    alias vim='mvim -v'
fi

# ssh
alias cofphe='ssh george@espresso.physics.cooper.edu -p 8198'
alias kahan='ssh ho@kahan.ee.cooper.edu -p 31415'
alias fontbakers='ssh -p 31415 -X fontbakers@kahan.ee.cooper.edu'
alias spcup='ssh spcup@199.98.27.237 -p 31415'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
