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



" ------------------
"  Programming in C
" ------------------
"  Yfcom  insert function comment
ab Yfcom  /**<ESC>ofunction_name - <ESC>o@parameters:<ESC>o<ESC>oDescription:<ESC>o/<ESC>A
"
"  Ysbl   insert statement block
ab Ysbl   {<ESC>o}<ESC>O 
"
"  Ydef   insert "#define" at start of line
ab Ydef   <ESC>0i#define
"
"  Yinc   insert "#include" at start of line
ab Yinc   <ESC>0i#include
"
"  Yelse  insert else clause of if statement with following if statement
ab Yelif  else if () {<ESC>o}<ESC>k$2hi
"
"  Yelse  insert else clause of if statement
ab Yelse  else {<ESC>o}<ESC>O   
"
"  Yfor   insert "for" statement
ab Yfor   for (;;) {<ESC>o}<ESC>kwa
"
"  Yif    insert "if" statement
ab Yif    if () {<ESC>o}<ESC>k$2hi
"
"  Ywhile insert "while" statement
ab Ywhile while () do {<ESC>o}<ESC>k$5hi
"
"  Ymain  insert "main" routine
ab Ymain  main (argc,argv) <ESC>oint argc;<ESC>ochar *argv;<ESC>o{<ESC>o}<ESC>O
"
"   <C-A> insert brackets for statement list
map <C-A> o{<ESC>o}<ESC>O                
"

" Insert mode:  Typing an opening curly bracket will insert a pair of
"  curly brackets and move the cursor before the closing curly bracket:
":inoremap { {}<ESC>i

" Insert mode:  Typing a closing curly bracket will jump after the next closing
" curly bracket (this assumes that curly brackets are always inserted as a pair.)
":inoremap  } <ESC>/}/e+1<C-M>i
