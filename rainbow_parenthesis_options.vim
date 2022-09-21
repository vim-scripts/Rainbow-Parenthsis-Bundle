"------------------------------------------------------------------------------
"  Description: Options settable by the rainbow_parenthesis plug-in
"    Copyright: Copyright (C) 2006 … 2022 Martin Krischik
"   Maintainer:	Martin Krischik (krischik@users.sourceforge.net)
"      Version: 5.4
"      History:	17.11.2006 MK rainbow_parenthesis_Options
"		01.01.2007 MK Bug fixing
"               09.10.2007 MK Now with round, square brackets, curly and angle
"                             brackets.
"               06.09.2022 MK Add colour sce
"               07.09.2022 MK Fix spelling mistake s/parenthesis/parenthesis/g
"               09.09.2022 MK Fixes for stricter VIM
"               18.09.2022 MK update quick installation
"	 Usage: copy content into your .vimrc and change options to your
"		liking.
"    Help Page: rainbow_parenthesis.txt
"------------------------------------------------------------------------------

echoerr 'It is suggested to copy the content of ada_options into .vimrc!'
finish " 1}}}

" Section: rainbow_parenthesis options {{{1

   let   g:rainbow_parenthesis_color_set  = "krischik"
   let   g:rainbow_parenthesis_commands	  = "1"
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

gcp --verbose --update after/syntax/rainbow_parenthesis.vim ~/vimfiles/bundles/.cache/.vimrc/.dein/after/syntax/rainbow_parenthesis.vim
gcp --verbose --update autoload/rainbow_parenthesis.vim	    ~/vimfiles/bundles/.cache/.vimrc/.dein/autoload/rainbow_parenthesis.vim
gcp --verbose --update doc/rainbow_parenthesis.txt          ~/vimfiles/bundles/.cache/.vimrc/.dein/doc/rainbow_parenthesis.txt
gcp --verbose --update plugin/rainbow_parenthesis.vim       ~/vimfiles/bundles/.cache/.vimrc/.dein/plugin/rainbow_parenthesis.vim
gcp --verbose --update rainbow_parenthesis_options.vim      ~/vimfiles/bundles/.cache/.vimrc/.dein/rainbow_parenthesis_options.vim

" }}}1

"------------------------------------------------------------------------------
"   Vim is Charityware - see ":help license" or uganda.txt for licence.
"------------------------------------------------------------------------------
" vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab textwidth=0 :
" vim: set fileencoding=utf-8 filetype=vim foldmethod=marker spell spelllang=en_gb:
