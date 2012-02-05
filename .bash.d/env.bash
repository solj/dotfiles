#############################################################################
# ~/.bash/env.bash: Custom environment variables                            #
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
GPG_TTY=$(tty)
export GPG_TTY

if [ -x /usr/bin/gpg-agent ]; then
	setup_gpg_agent
fi

PATH=~/bin:/usr/local/bin:${PATH}:/sbin
export PATH
