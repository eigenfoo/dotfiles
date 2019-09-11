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
alias ls='ls -GF'
alias la='ls -AGF'
alias ll='ls -lGF'
alias l='ls -laghFG'

# rm
alias rm='rm -I'

# disk
alias df='df -H'
alias du='du -ch'

# find
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# For git aliases below
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

alias ga='git add'
alias ga.='git add .'
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -d"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gc="git commit -v"  # Overrides... something
alias gca='git commit -va'
alias gcam='git commit -vam'
alias gc!='git commit -v --amend'
alias gd="git diff"
alias gdc="git diff --cached"
alias gf='git fetch'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --stat"  # glog -p to see diff!
alias gpull='git pull origin $(current_branch)'
alias gpush='git push origin $(current_branch)'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gst='git stash'
alias gsts='git stash show --text'
alias gsta='git stash apply'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gs="git status"  # Overrides Ghostscript, but you can still type `ghostscript` for that

# ssh
alias dtop='cd ~/Desktop'
alias cofphe='ssh george@espresso.physics.cooper.edu -p 8198'
alias kahan='ssh ho@kahan.ee.cooper.edu -p 31415'
alias fontbakers='ssh -p 31415 -X fontbakers@kahan.ee.cooper.edu'
alias spcup='ssh spcup@199.98.27.237 -p 31415'
