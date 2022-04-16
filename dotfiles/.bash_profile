[[ -r ~/.bashrc ]] && . ~/.bashrc

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# when at work, export path appropriately
if [ "$(whoami)" == "lh9054" ]; then
    export PATH=/home/ubuntu/anaconda3/bin:$PATH
fi
