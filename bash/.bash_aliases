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

# For git aliases below
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

alias ga='git add'
alias ga.='git add .'
alias gb='git branch'
alias gba='git branch -a'
alias gbc='git branch --merged | grep -vE "(^\*|master|develop)" | xargs -r git branch -d'  # Deletes merged branches
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gc='git commit -v'  # Overrides... something
alias gca='git commit -va'
alias gcam='git commit -vam'
alias gcm='git commit -vm'
alias gc!='git commit -v --amend'
alias gd='git diff --color-words=. --ignore-all-space'
alias gdc='git diff --cached'
alias gf='git fetch'
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gll="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --stat"
alias gpull='git pull origin $(current_branch)'
alias gpush='git push origin $(current_branch)'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gst='git stash'
alias gsts='git stash show --text'
alias gsta='git stash apply'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gs='git status'  # Overrides Ghostscript, but you can still type `ghostscript` for that

# ssh
machine="$(uname -s)"
case "${machine}" in
    Linux*)  NOTES_DIRECTORY=/mnt/alexandria/;;
    Darwin*) NOTES_DIRECTORY=/Volumes/alexandria/;;
esac
alias ww="vim -c VimwikiIndex"
alias wwd="cd $NOTES_DIRECTORY"
alias wwr='vim $(find $NOTES_DIRECTORY -name "*.md" -not -path "*/diary/*" | sort -R | head -n 1)'
alias cofphe='ssh george@espresso.physics.cooper.edu -p 8198'
alias kahan='ssh ho@kahan.ee.cooper.edu -p 31415'
alias fontbakers='ssh -p 31415 -X fontbakers@kahan.ee.cooper.edu'
alias spcup='ssh spcup@199.98.27.237 -p 31415'
