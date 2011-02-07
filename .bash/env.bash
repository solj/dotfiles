#############################################################################
# ~/.bash/env.bash: Custom environment variables                            #
# Copyright (C) 2011  Sol Jerome                                            #
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

##
# set my default editor
#
if [ -x /usr/bin/vim ]
then
	alias vi='/usr/bin/vim'
	export EDITOR=vim
else
	export EDITOR=vi
fi

# these are needed for debuild
export DEBEMAIL="sol.jerome@gmail.com"
export DEBFULLNAME="Sol Jerome"

# gpg stuff
GPG_TTY=`tty`
export GPG_TTY

if [ ! -e ${HOME}/.gpg-agent-info ]; then
	gpg-agent --daemon --enable-ssh-support \
		--write-env-file "${HOME}/.gpg-agent-info"
fi
#if [ -f "${HOME}/.gpg-agent-info" ]; then
#	. "${HOME}/.gpg-agent-info"
#	export GPG_AGENT_INFO
#	export SSH_AUTH_SOCK
#	export SSH_AGENT_PID
#fi

PATH=~/bin:/usr/local/bin:${PATH}:/sbin
export PATH
