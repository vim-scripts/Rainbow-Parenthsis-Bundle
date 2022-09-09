"------------------------------------------------------------------------------
"  Description: Rainbow colours for parenthesis
"    Copyright: Copyright (C) 2007 … 2022  Martin Krischik
"   Maintainer: Martin Krischik (krischik@users.sourceforge.net)
"               John Gilmore
"               Luc Hermitte (hermitte@free.fr)
"               slve (https://github.com/slve)
"      Version: 5.0.0
"      History: 24.05.2006 MK Unified Headers
"               15.10.2006 MK Bram's suggestion for runtime integration
"               06.09.2007 LH Buffer friendly (can be used in different buffers),
"                             can be toggled
"               09.09.2007 MK Use on LH's suggestion but use autoload to
"                             impove memory consumtion and startup performance
"               09.10.2007 MK Now with round, square brackets, curly and angle
"                             brackets.
"               06.09.2022 SL Improve to handle more then 16 level
"               07.09.2022 MK Fix spelling mistake s/parenthsis/parenthesis/g
"               07.09.2022 MK Add support for multiple colour sets.
"               09.09.2022 MK Fixes for stricter VIM
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

function rainbow_parenthesis#Activate()
    if ! exists ('g:rainbow_parenthesis_color_set')
        let g:rainbow_parenthesis_color_set="krischik"
    endif

    if g:rainbow_parenthesis_color_set == "slve"
        if &bg == "dark"
            highlight default hlLevel0 ctermfg=cyan        guifg=greenyellow
            highlight default hlLevel1 ctermfg=magenta     guifg=green1
            highlight default hlLevel2 ctermfg=red         guifg=springgreen1
            highlight default hlLevel3 ctermfg=yellow      guifg=cyan1
            highlight default hlLevel4 ctermfg=green       guifg=slateblue1
            highlight default hlLevel5 ctermfg=cyan        guifg=magenta1
            highlight default hlLevel6 ctermfg=magenta     guifg=purple1
            highlight default hlLevel7 ctermfg=red         guifg=red1
            highlight default hlLevel8 ctermfg=yellow      guifg=orange1
            highlight default hlLevel9 ctermfg=green       guifg=yellow1
        else
            highlight default hlLevel0 ctermfg=blue        guifg=yellow3
            highlight default hlLevel1 ctermfg=darkmagenta guifg=olivedrab4
            highlight default hlLevel2 ctermfg=red         guifg=green4
            highlight default hlLevel3 ctermfg=darkyellow  guifg=paleturquoise3
            highlight default hlLevel4 ctermfg=darkgreen   guifg=deepskyblue4
            highlight default hlLevel5 ctermfg=blue        guifg=darkslateblue
            highlight default hlLevel6 ctermfg=darkmagenta guifg=darkviolet
            highlight default hlLevel7 ctermfg=red         guifg=red3
            highlight default hlLevel8 ctermfg=darkyellow  guifg=orangered3
            highlight default hlLevel9 ctermfg=darkgreen   guifg=orange2
        endif
    else
        highlight default hlLevel0 ctermbg=LightGray ctermfg=brown        guibg=WhiteSmoke   guifg=RoyalBlue3
        highlight default hlLevel1 ctermbg=LightGray ctermfg=Darkblue     guibg=WhiteSmoke   guifg=SeaGreen3
        highlight default hlLevel2 ctermbg=LightGray ctermfg=darkgray     guibg=WhiteSmoke   guifg=DarkOrchid3
        highlight default hlLevel3 ctermbg=LightGray ctermfg=darkgreen    guibg=WhiteSmoke   guifg=firebrick3
        highlight default hlLevel4 ctermbg=LightGray ctermfg=darkcyan     guibg=AntiqueWhite guifg=RoyalBlue3
        highlight default hlLevel5 ctermbg=LightGray ctermfg=darkred      guibg=AntiqueWhite guifg=SeaGreen3
        highlight default hlLevel6 ctermbg=LightGray ctermfg=darkmagenta  guibg=AntiqueWhite guifg=DarkOrchid3
        highlight default hlLevel7 ctermbg=LightGray ctermfg=brown        guibg=AntiqueWhite guifg=firebrick3
        highlight default hlLevel8 ctermbg=LightGray ctermfg=gray         guibg=LemonChiffon guifg=RoyalBlue3
        highlight default hlLevel9 ctermbg=LightGray ctermfg=black        guibg=LemonChiffon guifg=SeaGreen3
    endif

    syntax cluster rainbow_parenthesis contains=hlLevel0,hlLevel1,hlLevel2,hlLevel3,hlLevel4,hlLevel5,hlLevel6,hlLevel7,hlLevel8,hlLevel9



    let rainbow_parenthesis#active = 1
endfunction

function rainbow_parenthesis#Clear()
    let i = 0
    while i != 10
        exe 'highlight clear hlLevel' . i
        let i = i + 1
    endwhile
    let rainbow_parenthesis#active = 0
endfunction

function rainbow_parenthesis#Toggle ()
    if ! exists('rainbow_parenthesis#active')
        call rainbow_parenthesis#LoadRound ()
    endif
    if exists('rainbow_parenthesis#active') && rainbow_parenthesis#active != 0
        call rainbow_parenthesis#Clear ()
    else
        call rainbow_parenthesis#Activate ()
    endif
endfunction

" Section: syntax {{{1
"
" Subsection: parentheses or round brackets: {{{2
"
function rainbow_parenthesis#LoadRound ()
    syntax match ParenError display ')'
    syntax region Paren0 transparent matchgroup=hlLevel0 start='(' end=')' contains=TOP containedin=TOP,Paren9
    syntax region Paren1 transparent matchgroup=hlLevel1 start='(' end=')' contains=TOP containedin=Paren0 contained
    syntax region Paren2 transparent matchgroup=hlLevel2 start='(' end=')' contains=TOP containedin=Paren1 contained
    syntax region Paren3 transparent matchgroup=hlLevel3 start='(' end=')' contains=TOP containedin=Paren2 contained
    syntax region Paren4 transparent matchgroup=hlLevel4 start='(' end=')' contains=TOP containedin=Paren3 contained
    syntax region Paren5 transparent matchgroup=hlLevel5 start='(' end=')' contains=TOP containedin=Paren4 contained
    syntax region Paren6 transparent matchgroup=hlLevel6 start='(' end=')' contains=TOP containedin=Paren5 contained
    syntax region Paren7 transparent matchgroup=hlLevel7 start='(' end=')' contains=TOP containedin=Paren6 contained
    syntax region Paren8 transparent matchgroup=hlLevel8 start='(' end=')' contains=TOP containedin=Paren7 contained
    syntax region Paren9 transparent matchgroup=hlLevel9 start='(' end=')' contains=TOP containedin=Paren8 contained
    syntax cluster rainbow_parenthesis contains=hlLevel0,hlLevel1,hlLevel2,hlLevel3,hlLevel4,hlLevel5,hlLevel6,hlLevel7,hlLevel8,hlLevel9
    highlight link ParenError Error
    let rainbow_parenthesis#active = 0
endfunction

" Subsection: box brackets or square brackets: {{{2
"
function rainbow_parenthesis#LoadSquare ()
    syntax match ParenError display ']'
    syntax region Paren0 transparent matchgroup=hlLevel0 start='\[' end=']' contains=TOP containedin=TOP,Paren9
    syntax region Paren1 transparent matchgroup=hlLevel1 start='\[' end=']' contains=TOP containedin=Paren0 contained
    syntax region Paren2 transparent matchgroup=hlLevel2 start='\[' end=']' contains=TOP containedin=Paren1 contained
    syntax region Paren3 transparent matchgroup=hlLevel3 start='\[' end=']' contains=TOP containedin=Paren2 contained
    syntax region Paren4 transparent matchgroup=hlLevel4 start='\[' end=']' contains=TOP containedin=Paren3 contained
    syntax region Paren5 transparent matchgroup=hlLevel5 start='\[' end=']' contains=TOP containedin=Paren4 contained
    syntax region Paren6 transparent matchgroup=hlLevel6 start='\[' end=']' contains=TOP containedin=Paren5 contained
    syntax region Paren7 transparent matchgroup=hlLevel7 start='\[' end=']' contains=TOP containedin=Paren6 contained
    syntax region Paren8 transparent matchgroup=hlLevel8 start='\[' end=']' contains=TOP containedin=Paren7 contained
    syntax region Paren9 transparent matchgroup=hlLevel9 start='\[' end=']' contains=TOP containedin=Paren8 contained
    syntax cluster rainbow_parenthesis contains=hlLevel0,hlLevel1,hlLevel2,hlLevel3,hlLevel4,hlLevel5,hlLevel6,hlLevel7,hlLevel8,hlLevel9
    highlight link ParenError Error
    let rainbow_parenthesis#active = 0
endfunction

" Subsection: curly brackets or braces: {{{2
"
function rainbow_parenthesis#LoadBraces ()
    syntax match ParenError display '}'
    syntax region Paren0 transparent matchgroup=hlLevel0 start='{' end='}' contains=TOP containedin=TOP,Paren9
    syntax region Paren1 transparent matchgroup=hlLevel1 start='{' end='}' contains=TOP containedin=Paren0 contained
    syntax region Paren2 transparent matchgroup=hlLevel2 start='{' end='}' contains=TOP containedin=Paren1 contained
    syntax region Paren3 transparent matchgroup=hlLevel3 start='{' end='}' contains=TOP containedin=Paren2 contained
    syntax region Paren4 transparent matchgroup=hlLevel4 start='{' end='}' contains=TOP containedin=Paren3 contained
    syntax region Paren5 transparent matchgroup=hlLevel5 start='{' end='}' contains=TOP containedin=Paren4 contained
    syntax region Paren6 transparent matchgroup=hlLevel6 start='{' end='}' contains=TOP containedin=Paren5 contained
    syntax region Paren7 transparent matchgroup=hlLevel7 start='{' end='}' contains=TOP containedin=Paren6 contained
    syntax region Paren8 transparent matchgroup=hlLevel8 start='{' end='}' contains=TOP containedin=Paren7 contained
    syntax region Paren9 transparent matchgroup=hlLevel9 start='{' end='}' contains=TOP containedin=Paren8 contained
    highlight link ParenError Error
    syntax cluster rainbow_parenthesis contains=hlLevel0,hlLevel1,hlLevel2,hlLevel3,hlLevel4,hlLevel5,hlLevel6,hlLevel7,hlLevel8,hlLevel9
    let rainbow_parenthesis#active = 0
endfunction

" Subsection: angle brackets or chevrons: {{{2
"
function rainbow_parenthesis#LoadChevrons ()
    syntax match ParenError display '>'
    syntax region Paren0 transparent matchgroup=hlLevel0 start='<' end='>' contains=TOP containedin=TOP,Paren9
    syntax region Paren1 transparent matchgroup=hlLevel1 start='<' end='>' contains=TOP containedin=Paren0 contained
    syntax region Paren2 transparent matchgroup=hlLevel2 start='<' end='>' contains=TOP containedin=Paren1 contained
    syntax region Paren3 transparent matchgroup=hlLevel3 start='<' end='>' contains=TOP containedin=Paren2 contained
    syntax region Paren4 transparent matchgroup=hlLevel4 start='<' end='>' contains=TOP containedin=Paren3 contained
    syntax region Paren5 transparent matchgroup=hlLevel5 start='<' end='>' contains=TOP containedin=Paren4 contained
    syntax region Paren6 transparent matchgroup=hlLevel6 start='<' end='>' contains=TOP containedin=Paren5 contained
    syntax region Paren7 transparent matchgroup=hlLevel7 start='<' end='>' contains=TOP containedin=Paren6 contained
    syntax region Paren8 transparent matchgroup=hlLevel8 start='<' end='>' contains=TOP containedin=Paren7 contained
    syntax region Paren9 transparent matchgroup=hlLevel9 start='<' end='>' contains=TOP containedin=Paren8 contained
    syntax cluster rainbow_parenthesis contains=hlLevel0,hlLevel1,hlLevel2,hlLevel3,hlLevel4,hlLevel5,hlLevel6,hlLevel7,hlLevel8,hlLevel9
    highlight link ParenError Error
    let rainbow_parenthesis#active = 0
endfunction

   " }}}1
finish

"------------------------------------------------------------------------------
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: set nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab textwidth=0 :
" vim: set fileencoding=utf-8 filetype=vim foldmethod=marker spell spelllang=en_GB:
