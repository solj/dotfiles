#############################################################################
# ~/.bash/prompt.bash: Customized .bash prompt                              #
# Copyright (C) 2010  Sol Jerome                                            #
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
# shamlessly stolen from cell's bash prompt
#
promptFunc()
{
    PREV_RET_VAL=$?;
	##
	# THRESHOLD_LOAD is the value of the 5 minute load
	# multiplied by 100 at which you want the prompt
	# to change from low to high
	#
	THRESHOLD_LOAD=200
	COLOR_LOW="${host}"
	COLOR_HIGH="$COLOR_RED"

	if [ `uname` == SunOS ]; then
		ONE=$(uptime|cut -d' ' -f 15|sed s/,//)
	elif [ `uname` == Darwin ]; then
		ONE=$(sysctl vm.loadavg|cut -d' ' -f 4|sed s/,//)
	else
		ONE=$(cat /proc/loadavg | cut -d' ' -f 3)
	fi

	ONEHUNDRED=$(echo -e "scale=0 \n $ONE/0.01 \nquit \n" | bc)

	if [ $ONEHUNDRED -gt $THRESHOLD_LOAD ]
	then
		HOST_COLOR=$COLOR_HIGH
	else
		HOST_COLOR=$COLOR_LOW
	fi
	# set the actual prompt
	if ${use_color} ; then
		PS1="${brks}[${dspt}\w${brks}] (${dspt}$(__git_ps1 "%s")${brks}) [${dspt}pts/\l${brks}]${host}\n\u${brks}@${HOST_COLOR}\h ${brks}"
	else
		PS1='\u@\h \w \$ '
	fi
	##
	# Makes sure the previous command
	# completed successfully, otherwise
	# returns the error number
	#
	if test $PREV_RET_VAL -eq 0
	then
		PS1="${PS1}\$ ${COLOR_NONE}"
	else
		PS1="${PS1}${COLOR_RED}[${PREV_RET_VAL}]${brks}\$ ${COLOR_NONE}"
	fi
}

##
# Change the window title of X terminals
#
PROMPT_COMMAND=promptFunc
