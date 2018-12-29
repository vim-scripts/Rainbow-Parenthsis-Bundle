"TODO new header
"
"------------------------------------------------------------------------------
"  Description: Rainbow colors for parenthsis
"          $Id: rainbow_parenthsis.vim 50 2007-10-08 18:42:51Z krischik@users.sourceforge.net $
"    Copyright: Copyright (C) 2007 Martin Krischik
"   Maintainer: Martin Krischik (krischik@users.sourceforge.net)
"               John Gilmore
"               Luc Hermitte (hermitte@free.fr)
"      $Author: krischik@users.sourceforge.net $
"        $Date: 2007-10-08 20:42:51 +0200 (Mo, 08 Okt 2007) $
"      Version: 4.0
"    $Revision: 50 $
"     $HeadURL: https://vim-scripts.googlecode.com/svn/trunk/1561%20Rainbow%20Parenthsis%20Bundle/autoload/rainbow_parenthsis.vim $
"      History: 24.05.2006 MK Unified Headers
"               15.10.2006 MK Bram's suggestion for runtime integration
"               06.09.2007 LH Buffer friendly (can be used in different buffers),
"                             can be toggled
"               09.09.2007 MK Use on LH's suggestion but use autoload to
"                             impove memory consumtion and startup performance
"               09.10.2007 MK Now with round, square brackets, curly and angle
"                             brackets.
"        Usage: copy to autoload directory.
"------------------------------------------------------------------------------
" This is a simple script. It extends the syntax highlighting to
" highlight each matching set of parens in different colors, to make
" it visually obvious what matches which.
"
" Obviously, most useful when working with lisp or Ada. But it's also nice other
" times.
"------------------------------------------------------------------------------

" Section: highlight {{{1

function rainbow_parenthsis#Activate()
    if &bg == "dark"
        hi default   hlLevel0 ctermfg=cyan        guifg=greenyellow
        hi default   hlLevel1 ctermfg=magenta     guifg=green1
        hi default   hlLevel2 ctermfg=red         guifg=springgreen1
        hi default   hlLevel3 ctermfg=yellow      guifg=cyan1
        hi default   hlLevel4 ctermfg=green       guifg=slateblue1
        hi default   hlLevel5 ctermfg=cyan        guifg=magenta1
        hi default   hlLevel6 ctermfg=magenta     guifg=purple1
        hi default   hlLevel7 ctermfg=red         guifg=red1
        hi default   hlLevel8 ctermfg=yellow      guifg=orange1
        hi default   hlLevel9 ctermfg=green       guifg=yellow1
    else
        hi default   hlLevel0 ctermfg=blue        guifg=yellow3
        hi default   hlLevel1 ctermfg=darkmagenta guifg=olivedrab4
        hi default   hlLevel2 ctermfg=red         guifg=green4
        hi default   hlLevel3 ctermfg=darkyellow  guifg=paleturquoise3
        hi default   hlLevel4 ctermfg=darkgreen   guifg=deepskyblue4
        hi default   hlLevel5 ctermfg=blue        guifg=darkslateblue
        hi default   hlLevel6 ctermfg=darkmagenta guifg=darkviolet
        hi default   hlLevel7 ctermfg=red         guifg=red3
        hi default   hlLevel8 ctermfg=darkyellow  guifg=orangered3
        hi default   hlLevel9 ctermfg=darkgreen   guifg=orange2
    endif
    let rainbow_parenthesis#active = 1
endfunction

function rainbow_parenthsis#Clear()
    let i = 0
    while i != 16
        let i = i + 1
        exe 'highlight clear level' . i . 'c'
    endwhile
    let rainbow_parenthesis#active = 0
endfunction

function rainbow_parenthsis#Toggle ()
    if ! exists('rainbow_parenthesis#active')
        syn off
        syn on
        call rainbow_parenthsis#LoadRound ()
    endif
    if exists('rainbow_parenthesis#active') && rainbow_parenthesis#active != 0
        call rainbow_parenthsis#Clear ()
    else
        call rainbow_parenthsis#Activate ()
    endif
endfunction

" Section: syntax {{{1
"
syntax cluster  rainbow_parenthsis contains=@TOP,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15,level16,NoInParens
" Subsection: parentheses or round brackets: {{{2
"

if &ft == "php"
    syn cluster PTop contains=@phpClTop
    syn cluster PComment contains=phpComment
else
    syn cluster PTop contains=TOP
    syn cluster PComment contains=Comment
endif

function rainbow_parenthsis#LoadRound ()
    syn match ParenError display ')'
    syn region Paren  transparent matchgroup=hlLevel0 start='(' end=')' contains=Paren1,@PTop containedin=@PTop
    syn region Paren1 transparent matchgroup=hlLevel1 start='(' end=')' contains=Paren2,@PTop
    syn region Paren2 transparent matchgroup=hlLevel2 start='(' end=')' contains=Paren3,@PTop
    syn region Paren3 transparent matchgroup=hlLevel3 start='(' end=')' contains=Paren4,@PTop
    syn region Paren4 transparent matchgroup=hlLevel4 start='(' end=')' contains=Paren5,@PTop
    syn region Paren5 transparent matchgroup=hlLevel5 start='(' end=')' contains=Paren6,@PTop
    syn region Paren6 transparent matchgroup=hlLevel6 start='(' end=')' contains=Paren7,@PTop
    syn region Paren7 transparent matchgroup=hlLevel7 start='(' end=')' contains=Paren8,@PTop
    syn region Paren8 transparent matchgroup=hlLevel8 start='(' end=')' contains=Paren9,@PTop
    syn region Paren9 transparent matchgroup=hlLevel9 start='(' end=')' contains=Paren,@PTop
    hi link ParenError Error
    let rainbow_parenthesis#active = 0
endfunction

" Subsection: box brackets or square brackets: {{{2
"
function rainbow_parenthsis#LoadSquare ()
    syn match ParenError display ']'
    syn region Paren  transparent matchgroup=hlLevel0 start='[' end=']' contains=Paren1,@PTop containedin=@PTop
    syn region Paren1 transparent matchgroup=hlLevel1 start='[' end=']' contains=Paren2
    syn region Paren2 transparent matchgroup=hlLevel2 start='[' end=']' contains=Paren3
    syn region Paren3 transparent matchgroup=hlLevel3 start='[' end=']' contains=Paren4
    syn region Paren4 transparent matchgroup=hlLevel4 start='[' end=']' contains=Paren5
    syn region Paren5 transparent matchgroup=hlLevel5 start='[' end=']' contains=Paren6
    syn region Paren6 transparent matchgroup=hlLevel6 start='[' end=']' contains=Paren7
    syn region Paren7 transparent matchgroup=hlLevel7 start='[' end=']' contains=Paren8
    syn region Paren8 transparent matchgroup=hlLevel8 start='[' end=']' contains=Paren9
    syn region Paren9 transparent matchgroup=hlLevel9 start='[' end=']' contains=Paren
    hi link ParenError Error
    let rainbow_parenthesis#active = 0
endfunction

" Subsection: curly brackets or braces: {{{2
"
function rainbow_parenthsis#LoadBraces ()
    syn match ParenError display '}'
    syn region Paren  transparent matchgroup=hlLevel0 start='{' end='}' contains=Paren1,@PTop containedin=@PTop
    syn region Paren1 transparent matchgroup=hlLevel1 start='{' end='}' contains=Paren2
    syn region Paren2 transparent matchgroup=hlLevel2 start='{' end='}' contains=Paren3
    syn region Paren3 transparent matchgroup=hlLevel3 start='{' end='}' contains=Paren4
    syn region Paren4 transparent matchgroup=hlLevel4 start='{' end='}' contains=Paren5
    syn region Paren5 transparent matchgroup=hlLevel5 start='{' end='}' contains=Paren6
    syn region Paren6 transparent matchgroup=hlLevel6 start='{' end='}' contains=Paren7
    syn region Paren7 transparent matchgroup=hlLevel7 start='{' end='}' contains=Paren8
    syn region Paren8 transparent matchgroup=hlLevel8 start='{' end='}' contains=Paren9
    syn region Paren9 transparent matchgroup=hlLevel9 start='{' end='}' contains=Paren
    hi link ParenError Error
    let rainbow_parenthesis#active = 0
endfunction

" Subsection: angle brackets or chevrons: {{{2
"
function rainbow_parenthsis#LoadChevrons ()
    syn match ParenError display '>'
    syn region Paren  transparent matchgroup=hlLevel0 start='<' end='>' contains=Paren1,@PTop containedin=@PTop
    syn region Paren1 transparent matchgroup=hlLevel1 start='<' end='>' contains=Paren2
    syn region Paren2 transparent matchgroup=hlLevel2 start='<' end='>' contains=Paren3
    syn region Paren3 transparent matchgroup=hlLevel3 start='<' end='>' contains=Paren4
    syn region Paren4 transparent matchgroup=hlLevel4 start='<' end='>' contains=Paren5
    syn region Paren5 transparent matchgroup=hlLevel5 start='<' end='>' contains=Paren6
    syn region Paren6 transparent matchgroup=hlLevel6 start='<' end='>' contains=Paren7
    syn region Paren7 transparent matchgroup=hlLevel7 start='<' end='>' contains=Paren8
    syn region Paren8 transparent matchgroup=hlLevel8 start='<' end='>' contains=Paren9
    syn region Paren9 transparent matchgroup=hlLevel9 start='<' end='>' contains=Paren
    hi link ParenError Error
    let rainbow_parenthesis#active = 0
endfunction

   " }}}1
finish

"------------------------------------------------------------------------------
"   Copyright (C) 2006  Martin Krischik
"
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: textwidth=78 wrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab
" vim: filetype=vim foldmethod=marker
