#############################################################################
# ~/.bash/aliases.bash: Custom bash aliases                                 #
# Copyright (C) 2012  Sol Jerome                                            #
#                                                                           #
# This is free software; you can redistribute it and/or modify it under     #
# the terms of the GNU General Public License as published by the Free      #
# Software Foundation; either version 2 of the License, or (at your option) #
# any later version.                                                        #
#                                                                           #
# This is distributed in the hope that it will be useful, but WITHOUT       #
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or     #
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License     #
# for more details.                                                         #
#                                                                           #
# You should have received a copy of the GNU General Public License along   #
# with this program; if not, write to the Free Software Foundation, Inc.,   #
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.               #
#############################################################################

alias bye='exit'
alias aoeu='setxkbmap us'
alias asdf='setxkbmap dvorak'
alias rm='rm -i'
alias cd='pushd'
alias bd='popd'
alias cdh='cd ~'
alias ldapvim='ldapvi -Y GSSAPI'
if [ ! $TMUX ]; then
	alias tmux='tmux attach -d || tmux'
fi
if [ `uname` == SunOS ]; then
	alias grep='/usr/xpg4/bin/grep'
else
	alias grep='grep --color=auto'
	alias ls='ls --color=auto'
fi

##
# ls aliases
#
if [ "$TERM" != "dumb" ]; then
    alias ll='ls -lvF --color'
    alias lss='ls -AlvF --color'
fi
