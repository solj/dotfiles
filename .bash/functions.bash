#############################################################################
# ~/.bash/functions.bash: Useful functions                                  #
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
# make extraction easier
#
extract()
{
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xvjf $1	;;
			*.tar.gz)	tar xvzf $1	;;
			*.bz2)		bunzip2 -v $1	;;
			*.rar)		unrar x $1	;;
			*.gz)		gunzip -v $1	;;
			*.tbz2)		tar xvjf $1	;;
			*.tgz)		tar xvzf $1	;;
			*.zip)		unzip $1	;;
			*.Z)		uncompress $1	;;
			*.7z)		7z x $1		;;
			*)		echo "'$1' cannot be extracted via extract()";;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}
