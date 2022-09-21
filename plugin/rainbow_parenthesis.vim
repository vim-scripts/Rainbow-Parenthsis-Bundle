"------------------------------------------------------------------------------
"  Description: Rainbow colours for parenthesis
"    Copyright: Copyright (C) 2006 … 2022  Martin Krischik
"   Maintainer: Martin Krischik
"               John Gilmore
"      Version: 5.4
"      History: 24.05.2006 MK Unified Headers
"               15.10.2006 MK Bram's suggestion for runtime integration
"               06.09.2007 LH Buffer friendly (can be used in different buffers),
"                             can be toggled
"               09.09.2007 MK Use on LH's suggestion but use autoload to
"                             improve memory consumption and startup performance
"               09.10.2007 MK Now with round, square brackets, curly and angle
"                             brackets.
"               07.09.2022 MK Fix spelling mistake s/parenthsis/parenthesis/g
"               07.09.2022 MK Add commands for all functions
"               09.09.2022 MK Fixes for stricter VIM
"               18.09.2022 MK Option to add all commands
"        Usage: copy to plugin directory.
"------------------------------------------------------------------------------
" This is a simple script. It extends the syntax highlighting to
" highlight each matching set of parenthesis in different colours, to make
" it visually obvious what matches which.
"
" Obviously, most useful when working with lisp or Ada. But it's also nice other
" times.
"------------------------------------------------------------------------------

command! -nargs=0 ToggleRainbowParenthesis        call rainbow_parenthesis#Toggle ()

if exists ('g:rainbow_parenthesis_commands')
    command! -nargs=0 RainbowParenthesisActivate      call rainbow_parenthesis#Activate ()
    command! -nargs=0 RainbowParenthesisAll           call rainbow_parenthesis#All ()
    command! -nargs=0 RainbowParenthesisClear         call rainbow_parenthesis#Clear ()
    command! -nargs=0 RainbowParenthesisLoadBraces    call rainbow_parenthesis#LoadBraces ()
    command! -nargs=0 RainbowParenthesisLoadChevrons  call rainbow_parenthesis#LoadChevrons ()
    command! -nargs=0 RainbowParenthesisLoadRound     call rainbow_parenthesis#LoadRound ()
    command! -nargs=0 RainbowParenthesisLoadSquare    call rainbow_parenthesis#LoadSquare ()
endif

finish

"------------------------------------------------------------------------------
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab textwidth=0 :
" vim: set fileencoding=utf-8 filetype=vim foldmethod=marker spell spelllang=en_gb:
