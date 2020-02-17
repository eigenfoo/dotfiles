# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:/usr/local/bin:$HOME/miniconda3/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=/Users/george/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pygmalion"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

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
    Linux*)  NOTES_DIRECTORY=/keybase/private/eigenfoo;;
    Darwin*) NOTES_DIRECTORY=/Volumes/Keybase/private/eigenfoo;;
esac
alias ww="vim -c VimwikiIndex"
alias wwd="cd $NOTES_DIRECTORY"
alias wwr='vim $(find $NOTES_DIRECTORY -name "*.md" -not -path "*/diary/*" | sort -R | head -n 1)'
alias dtop='cd ~/Desktop'
alias cofphe='ssh george@espresso.physics.cooper.edu -p 8198'
alias kahan='ssh ho@kahan.ee.cooper.edu -p 31415'
alias fontbakers='ssh -p 31415 -X fontbakers@kahan.ee.cooper.edu'
alias spcup='ssh spcup@199.98.27.237 -p 31415'

export TERM=xterm-color
export VIRTUAL_ENV_DISABLE_PROMPT=
