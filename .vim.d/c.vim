"############################################################################
" ~/.vim.d/c.vim: C programming for vim                                     #
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
