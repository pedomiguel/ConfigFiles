# Ensure shell is interactive
case $- in
    *i*) ;;
      *) return;;
esac

# History settings
HISTCONTROL=ignoredups
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Window size update
shopt -s checkwinsize

# Enable lesspipe for friendly file viewing
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Chroot prompt
# --- Fedora-friendly prompt with Git branch support ---

# Load git-prompt helper for __git_ps1
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
fi

# Always color if TERM supports it
case "$TERM" in
    xterm-color|*-256color|xterm-kitty) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=yes
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[92m\]\u '
    PS1+='\[\033[01;34m\]\w\[\033[00m\]'
    PS1+='$(__git_ps1 " \[\033[33m\](%s)\[\033[00m\]")'
    PS1+='\n '
else
    PS1='\u@\h:\w$(__git_ps1 " (%s)")\n$ '
fi

# Xterm/rxvt window title
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;\u@\h: \w\a\]$PS1"
        ;;
esac

# Color support for commands
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b ~/.dircolors 2>/dev/null || dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Aliases
alias vi='vimx'
alias ll='ls -alF'
alias la='ls -A'
alias lm='ls --almost-all'
alias l='ls -CF'
alias rm='trash-put' # Safe rm
alias cls='tput reset'
alias ext='exit'
alias scb='source ~/.bashrc'
alias scv='source .venv/bin/activate' # source python enviroment
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
# Core programs aliases
alias py='python3'
alias mk='make'
alias nv='nvim'
# Tmux
alias tm='tmux'
alias tml='tmux ls'
alias tmk='tmux kill-session -t'
alias tmks='tmux kill-server'
alias tmn='tmux new -s'
alias tmc='tmux new-session -s tmp -c'
alias tma='tmux attach'
# Docker
alias dk='docker'
alias dkps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dkl='docker logs --tail=100'
alias dkc='docker-compose'
# Git
alias gt='git'
# Alert for long-running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Include ~/.bash_aliases if available
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Bash completion
if ! shopt -oq posix; then
    [ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
    [ -f /etc/bash_completion ] && . /etc/bash_completion
fi

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export IGNOREEOF=5

# Custom functions
copycmd() {
    if [ -z "$1" ]; then
        history -p !! | xclip -selection clipboard
    else
        history -p !$1 | xclip -selection clipboard
    fi
}

# Functions
clsall() { # Function to clear all the scrollback buffer
    read -p "Are you sure you want to clear the terminal and scrollback buffer? (Y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        echo "Operation canceled."
    else
        clear && printf '\e[3J'
    fi
}

headclip() { # Functin to copy the first n lines of a file
    local lines=1
    if [ $# -ge 2 ]; then
        lines=$1
        shift
    fi
    output=$(head -n "$lines" "$1")
    echo "$output" | xclip -selection clipboard
    echo "$output copied!"
}

set -o vi # Set bash to use vi mode for command editing
bind -s 'set completion-ignore-case on' # Ignore sensitive case on completion

# Add paths for custom binaries
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export PATH="$PATH:$CWPROOT/bin"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/miniconda3/bin"

# Disable automatic Conda initialization, but allow manual activation
export CONDA_AUTO_ACTIVATE_BASE=false

# Custom colors for the terminal prompt
blk='\[\033[38;5;245m\]'  # Dark Gray
red='\[\033[38;5;196m\]'  # Bright Red
grn='\[\033[38;5;46m\]'   # Bright Green
ylw='\[\033[38;5;226m\]'  # Bright Yellow
blu='\[\033[38;5;39m\]'   # Bright Blue
pur='\[\033[38;5;135m\]'  # Bright Purple
cyn='\[\033[38;5;51m\]'   # Bright Cyan
wht='\[\033[38;5;15m\]'   # Pure White

export CWPROOT=/usr/local/cwp
export PATH=$PATH:$CWPROOT/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/carburauto/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/carburauto/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/carburauto/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/carburauto/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# . "$HOME/.cargo/env"

# Created by `pipx` on 2025-09-27 17:20:54
export PATH="$PATH:/home/carburauto/.local/bin"
