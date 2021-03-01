#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Source USER specific bashrc since hostnames change in cluster
# enviroments
source $HOME/.bashrc.$USER

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\$(parse_git_branch)\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
## arrow up
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias ls='ls --color=auto'
alias dotfiles='/usr/bin/git --git-dir=$HOME/code/dotfiles/ --work-tree=$HOME'
