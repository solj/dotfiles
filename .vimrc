"############################################################################
" ~/.vimrc: Custom vimrc                                                    #
" Copyright (C) 2012  Sol Jerome                                            #
"                                                                           #
" This is free software; you can redistribute it and/or modify it under     #
" the terms of the GNU General Public License as published by the Free      #
" Software Foundation; either version 2 of the License, or (at your option) #
" any later version.                                                        #
"                                                                           #
" This is distributed in the hope that it will be useful, but WITHOUT       #
" ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or     #
" FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License     #
" for more details.                                                         #
"                                                                           #
" You should have received a copy of the GNU General Public License along   #
" with this program; if not, write to the Free Software Foundation, Inc.,   #
" 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.               #
"############################################################################

set ai			" Always set auto-indenting on
set term=xterm		" Fix the Home and End keys
set noexpandtab
set title		" Give me a cool vim title
set ttyscroll=0
set ttyfast
set hlsearch		" Highlighted search
set incsearch		" Search as you type
set modeline            " read file-specific settings
set encoding=utf-8
set autoindent
set background=dark
set textwidth=72

" include local customizations
source .vim.d/statusline.vim
source .vim.d/c.vim

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
	\ if ! exists("g:leave_my_cursor_position_alone") |
	\     if line("'\"") > 0 && line ("'\"") <= line("$") |
	\         exe "normal g'\"" |
	\     endif |
	\ endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

"Maps Alt-arrows to navigating Vim splits
map <silent> <A-Left> <C-w>h
map <silent> <A-Down> <C-w>j
map <silent> <A-Up> <C-w>k
map <silent> <A-Right> <C-w>l

filetype plugin on
filetype indent on
