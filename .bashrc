#############################################################################
# ~/.bashrc: Customized .bashrc                                             #
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

#########################################################################
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !
#########################################################################
##
# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
#
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

if [ -x /usr/bin/lsb_release ]; then
	DISTRO=`lsb_release -i | cut -d'	' -f2`
fi

##
# source other necessary stuff
#
BASH_DOTDIR=~/.bash.d
BASH_FILES=(colors my-funcs aliases `hostname` prompt env)
if [ -f /etc/bashrc ]; then source /etc/bashrc; fi # fedora
if [ -f /etc/bash/bashrc ]; then source /etc/bash/bashrc; fi # gentoo
if [ "$DISTRO" != "Ubuntu" ]; then
	if [ -f /etc/profile ]; then source /etc/profile; fi
fi
if [ -d ~/.bash_completion.d ]; then source ~/.bash_completion.d/*; fi # bash completion ftw
for f in ${BASH_FILES[*]}
do
	if [ -f $BASH_DOTDIR/$f.bash ]; then source $BASH_DOTDIR/$f.bash; fi
done

##
# Enable colors for ls, etc.
# Prefer ~/.dir_colors
#
if [ -x dircolors ]; then
	eval `dircolors -b ~/.dir_colors`
fi

##
# don't duplicate lines in history
#
export HISTCONTROL=ignoredups

set noclobber
##
# http://caliban.org/bash/
#
shopt -s checkwinsize
shopt -s cdspell
shopt -s extglob
