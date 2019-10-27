#!/bin/sh
clear # clear terminal

if [ -z "$y" ] # y is subshell number
then
y=1
else
y=$((y+1))
fi
export y

echo "\033[01;32msubshell_$((y)): $@\033[00m" # display last command

"$@" # execute bash with command argument

#'\w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u-\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$'
PROMPT_COMMAND='PS1="\[\033[01;32m\]\u-\h_subshell_$((y))\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ";unset PROMPT_COMMAND' bash # modify bash appearance
