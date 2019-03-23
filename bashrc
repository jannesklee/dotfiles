#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#------------------ set PROMPT ------------------------------------------------#
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

#---------------- color support for ls and grep -------------------------------#
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#--------------- custom aliases -----------------------------------------------#
# fast folder switch
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

#--------------- custom pathes ------------------------------------------------#
export FOS="/home/jklee/src/fosite/"

#--------------- path extensionsion -------------------------------------------#
export PATH="/home/jklee/anaconda3/bin:$PATH"
PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

#-------------- increase history size -----------------------------------------#
HISTSIZE=10000
HISTFILESIZE=50000

#------------- enable vim clientserver by default -----------------------------#
alias vim='vim --servername vim'
