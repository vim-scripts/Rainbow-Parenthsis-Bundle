"------------------------------------------------------------------------------
"  Description: Rainbow colours for parenthesis
"    Copyright: Copyright (C) 2006 … 2022  Martin Krischik
"   Maintainer: Martin Krischik
"               John Gilmore
"      Version: 5.3.0
"      History: 18.09.2022 MK add after syntax file 
"------------------------------------------------------------------------------
" This is a simple script. It extends the syntax highlighting to
" highlight each matching set of parenthesis in different colours, to make
" it visually obvious what matches which.
"
" Obviously, most useful when working with lisp or Ada. But it's also nice other
" times.
"------------------------------------------------------------------------------

autocmd Syntax * runtime plugin/RainbowParenthesis.vim

"------------------------------------------------------------------------------
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab textwidth=0 :
" vim: set fileencoding=utf-8 filetype=vim foldmethod=marker spell spelllang=en_gb:
