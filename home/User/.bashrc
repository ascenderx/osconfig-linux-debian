##########
# This file is intended for Bourne-again Shells (bash).
# This file by default is sourced in non-login mode, though it can be
# sourced in login mode as well from .bash_profile.
##########

# Set file creation mask.
# Each set bit is an unset flag for each new file.
# Example: umask 022 means chmod go-w.
umask 022

# Set $PATH so that it includes the user's privates binaries, if the
# direcroty exists.
if [[ -d "$HOME/bin" ]]
then
  export PATH="$HOME/bin:$PATH"
fi

# Run the user's path-include script, if it exists.
if [[ -f "$HOME/.bash_include" ]]
then
  source $HOME/.bash_include
fi

# Test for an interactive shell. There is no need to set anything
# past this point for scp and rcp, and it's important to refrain 
# from outputting anything in those cases.
if [[ $- != *i* ]]
then
	# Shell is non-interactive. Be done now!
	return
fi

# Query on deletion, etc.
alias cp="/usr/bin/env cp -i"
alias mv="/usr/bin/env mv -i"
alias rm="/usr/bin/env rm -i"

# Use human-readable file sizes when checking free space, disk
# listings, etc.
alias df="/usr/bin/env df -h"
alias du="/usr/bin/env du -h"

# Display regex searches in color.
alias grep="/usr/bin/env grep --color"
alias egrep="/usr/bin/env egrep --color"
alias fgrep="/usr/bin/env fgrep --color"

# List directories in color, directories first.
if [[ -f "$HOME/.dircolors" ]]
then
  eval $(dircolors $HOME/.dircolors)
fi

alias ls="/usr/bin/env ls -Fx --color=auto --group-directories-first"

# Colorize the prompt.
shellstr="\[\e[1;38;2;255;0;0m\]""bash"
userstr="\[\e[1;38;2;255;255;0m\]""\u"
atstr="\[\e[1;38;2;0;255;127m\]""@"
hoststr="\[\e[1;38;2;255;0;0m\]""\h"
dirstr="\[\e[1;38;2;0;255;255m\]""\W"
symstr="\[\e[1;38;2;0;255;127m\]""\$"
reset="\[\e[0m\]"

PS1="$shellstr $userstr$atstr$hoststr $dirstr $symstr$reset "

unset shellstr userstr atstr hoststr dirstr symstr reset

# Set the terminal command to update the title on each line.
PROMPT_COMMAND='thisdir=$(basename "$PWD"); echo -ne "\e]0;$USER@$HOSTNAME:$thisdir\x07"; unset thisdir'

# History size settings.
export HISTSIZE=1000
export HISTFILESIZE=2000

# Don't put duplicate lines or lines starting with spaces in the 
# history.
export HISTCONTROL=ignoreboth

# Append to the history file; don't overwrite it.
shopt -s histappend

# Store multi-line commands as a single command.
shopt -s cmdhist

# Check the window size after each command, and, if necessary, 
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# The pattern "**" use in a pathname expansion context will match
# all files and zero or more directories and subdirectories.
shopt -s globstar

# Expand aliases.
shopt -s expand_aliases

