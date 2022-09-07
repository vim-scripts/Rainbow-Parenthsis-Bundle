"------------------------------------------------------------------------------
"  Description: Options settable by the rainbow_parenthesis plug-in
"    Copyright: Copyright (C) 2006 … 2022 Martin Krischik
"   Maintainer:	Martin Krischik (krischik@users.sourceforge.net)
"      Version: 4.0
"      History:	17.11.2006 MK rainbow_parenthesis_Options
"		01.01.2007 MK Bug fixing
"               09.10.2007 MK Now with round, square brackets, curly and angle
"                             brackets.
"               06.09.2022 MK Add colour sce
"               07.09.2022 MK Fix spelling mistake s/parenthsis/parenthesis/g 
"	 Usage: copy content into your .vimrc and change options to your
"		liking.
"    Help Page: rainbow_parenthesis.txt
"------------------------------------------------------------------------------

echoerr 'It is suggested to copy the content of ada_options into .vimrc!'
finish " 1}}}

" Section: rainbow_parenthesis options {{{1

   let   g:ada_abbrev		       = "default"

" }}}1

" Section: Vimball options {{{1
:set noexpandtab fileformat=unix encoding=utf-8
:31,34 MkVimball rainbow_parenthesis-4.0.vba

autoload/rainbow_parenthesis.vim
doc/rainbow_parenthesis.txt
plugin/rainbow_parenthesis.vim
rainbow_parenthesis_options.vim

" }}}1

" Section: Tar options {{{1

tar --create --bzip2				\
   --file="rainbow_parenthesis-4.0.tar.bz2"	\
   rainbow_parenthesis_options.vim		\
   doc/rainbow_parenthesis.txt			\
   autoload/rainbow_parenthesis.vim		\
   plugin/rainbow_parenthesis.vim		;

" }}}1

" Section: Quick Installation {{{1

gcp --verbose --update autoload/rainbow_parenthsis.vim  ~/vimfiles/autoload/rainbow_parenthsis.vim  
gcp --verbose --update doc/rainbow_parenthsis.txt       ~/vimfiles/doc/rainbow_parenthsis.txt       
gcp --verbose --update plugin/rainbow_parenthsis.vim    ~/vimfiles/plugin/rainbow_parenthsis.vim    
gcp --verbose --update rainbow_parenthsis_options.vim   ~/vimfiles/rainbow_parenthsis_options.vim   


" }}}1

"------------------------------------------------------------------------------
"   Vim is Charityware - see ":help license" or uganda.txt for licence.
"------------------------------------------------------------------------------
" vim: textwidth=0 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker
"

" vim: set nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab textwidth=0 :
" vim: set fileencoding=utf-8 filetype=vim foldmethod=marker spell spelllang=en_GB:
