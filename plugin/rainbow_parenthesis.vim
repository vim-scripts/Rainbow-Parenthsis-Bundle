"------------------------------------------------------------------------------
"  Description: Rainbow colors for parenthesis
"    Copyright: Copyright (C) 2006 … 2022  Martin Krischik
"   Maintainer: Martin Krischik
"               John Gilmore
"      Version: 4.0
"      History: 24.05.2006 MK Unified Headers
"               15.10.2006 MK Bram's suggestion for runtime integration
"               06.09.2007 LH Buffer friendly (can be used in different buffers),
"                             can be toggled
"               09.09.2007 MK Use on LH's suggestion but use autoload to
"                             impove memory consumtion and startup performance
"               09.10.2007 MK Now with round, square brackets, curly and angle
"                             brackets.
"               07.09.2022 MK Fix spelling mistake s/parenthsis/parenthesis/g 
"               07.09.2022 MK Add Commmands for all functions
"        Usage: copy to plugin directory.
"------------------------------------------------------------------------------
" This is a simple script. It extends the syntax highlighting to
" highlight each matching set of parens in different colors, to make
" it visually obvious what matches which.
"
" Obviously, most useful when working with lisp or Ada. But it's also nice other
" times.
"------------------------------------------------------------------------------

command! -nargs=0 ToggleRainbowParenthesis        call rainbow_parenthesis#Toggle()

# command! -nargs=0 RainbowParenthesisToggle        call rainbow_parenthesis#Toggle()
# command! -nargs=0 RainbowParenthesisActivate      call rainbow_parenthesis#Activate()
# command! -nargs=0 RainbowParenthesisClear         call rainbow_parenthesis#Clear()
# command! -nargs=0 RainbowParenthesisToggle        call rainbow_parenthesis#Toggle ()
# command! -nargs=0 RainbowParenthesisLoadRound     call rainbow_parenthesis#LoadRound ()
# command! -nargs=0 RainbowParenthesisLoadSquare    call rainbow_parenthesis#LoadSquare ()
# command! -nargs=0 RainbowParenthesisLoadBraces    call rainbow_parenthesis#LoadBraces ()
# command! -nargs=0 RainbowParenthesisLoadChevrons  call rainbow_parenthesis#LoadChevrons ()

"------------------------------------------------------------------------------
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: textwidth=78 wrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab
" vim: filetype=vim foldmethod=marker
