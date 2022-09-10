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

# For git aliases below
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

alias ga.='git add .'
alias gb='git branch'
alias gba='git branch -a'

if command -v fzf &> /dev/null
then
    alias f='vim $(fzf)'
    alias ga='git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git add'
    alias gco='git branch | fzf | xargs git checkout'
    alias gbd='git branch | fzf -m | xargs git branch -d'
    alias gbD='git branch | fzf -m | xargs git branch -D'
else
    alias ga='git add'
    alias gco='git checkout'
    alias gbd='git branch -d'
    alias gbD='git branch -D'
fi

alias gcob='git checkout -b'
alias gc='git commit -v'  # Overrides... something
alias gca='git commit -va'
alias gcam='git commit -vam'
alias gcm='git commit -vm'
alias gc!='git commit -v --amend'
alias gd='git diff'
alias gdc='git diff --cached'
alias gf='git fetch'
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gll="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --stat"
alias gpull='git pull origin $(current_branch)'
alias gpush='git push origin $(current_branch)'
alias gfpush='git push --force origin $(current_branch)'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gst='git stash'
alias gsts='git stash show --text'
alias gsta='git stash apply'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gs='git status'  # Overrides Ghostscript, but you can still type `ghostscript` for that

# macvim
if command -v mvim &> /dev/null
then
    alias vim='mvim -v'
fi

# ssh
machine="$(uname -s)"
case "${machine}" in
    Linux*)  NOTES_DIRECTORY=/mnt/alexandria/;;
    Darwin*) NOTES_DIRECTORY=/Volumes/alexandria/;;
esac
alias cofphe='ssh george@espresso.physics.cooper.edu -p 8198'
alias kahan='ssh ho@kahan.ee.cooper.edu -p 31415'
alias fontbakers='ssh -p 31415 -X fontbakers@kahan.ee.cooper.edu'
alias spcup='ssh spcup@199.98.27.237 -p 31415'
