"------------------------------------------------------------------------------
"  Description: Rainbow colours for parenthesis
"    Copyright: Copyright (C) 2007 … 2022  Martin Krischik
"   Maintainer: Martin Krischik (krischik@users.sourceforge.net)
"		John Gilmore
"		Luc Hermitte (hermitte@free.fr)
"		slve (https://github.com/slve)
"		Βασίλης (https://github.com/autre)
"		Charlie Tanksley (charlie.tanksley@gmail.com)
"		Jonathan Wilkins (https://github.com/jwilkins)
"      Version: 5.3.0
"      History: 24.05.2006 MK Unified Headers
"		15.10.2006 MK Bram's suggestion for runtime integration
"		06.09.2007 LH Buffer friendly (can be used in different buffers),
"			      can be toggled
"		09.09.2007 MK Use on LH's suggestion but use autoload to
"			      impove memory consumtion and startup performance
"		09.10.2007 MK Now with round, square brackets, curly and angle
"			      brackets.
"		06.09.2022 SL Improve to handle more then 16 level aw well as
"			      reducing to 10 distinct level.
"		07.09.2022 MK Fix spelling mistake s/parenthsis/parenthesis/g
"		07.09.2022 MK Add support for multiple colour sets.
"		09.09.2022 MK Fixes for stricter VIM
"		10.09.2022 AU A dark colour scheme.
"		10.09.2022 AU simpler approach to the handling of
"			      rainbow_parenthesis#active
"		15.09.2022 CT colour scheme without background colour
"		17.09.2022 JW colour scheme without terminal background colour
"		19.09.2022 MK return to 16 highlight level as most colour
"			      schema are made for multiples of 4.
"	 Usage: copy to autoload directory.
"------------------------------------------------------------------------------
" This is a simple script. It extends the syntax highlighting to
" highlight each matching set of parenthesis in different colours, to make
" it visually obvious what matches which.
"
" Obviously, most useful when working with lisp or Ada. But it's also nice other
" times.
"------------------------------------------------------------------------------

" Section: highlight {{{1

function rainbow_parenthesis#Activate ()
    if ! exists ('g:rainbow_parenthesis_color_set')
	let g:rainbow_parenthesis_color_set=""
    endif

    if g:rainbow_parenthesis_color_set == "slve"
	if &bg == "dark"
	    highlight default hlLevel0			ctermfg=cyan				guifg=greenyellow
	    highlight default hlLevel1			ctermfg=magenta				guifg=green1
	    highlight default hlLevel2			ctermfg=red				guifg=springgreen1
	    highlight default hlLevel3			ctermfg=yellow				guifg=cyan1
	    highlight default hlLevel4			ctermfg=green				guifg=slateblue1
	    highlight default hlLevel5			ctermfg=cyan				guifg=magenta1
	    highlight default hlLevel6			ctermfg=magenta				guifg=purple1
	    highlight default hlLevel7			ctermfg=red				guifg=red1
	    highlight default hlLevel8			ctermfg=yellow				guifg=orange1
	    highlight default hlLevel9			ctermfg=green				guifg=yellow1
	    highlight default hlLevel10			ctermfg=cyan				guifg=greenyellow
	    highlight default hlLevel11			ctermfg=magenta				guifg=green1
	    highlight default hlLevel12			ctermfg=red				guifg=springgreen1
	    highlight default hlLevel13			ctermfg=yellow				guifg=cyan1
	    highlight default hlLevel14			ctermfg=green				guifg=slateblue1
	    highlight default hlLevel15			ctermfg=cyan				guifg=magenta1
	else
	    highlight default hlLevel0			ctermfg=blue				guifg=yellow3
	    highlight default hlLevel1			ctermfg=darkmagenta			guifg=olivedrab4
	    highlight default hlLevel2			ctermfg=red				guifg=green4
	    highlight default hlLevel3			ctermfg=darkyellow			guifg=paleturquoise3
	    highlight default hlLevel4			ctermfg=darkgreen			guifg=deepskyblue4
	    highlight default hlLevel5			ctermfg=blue				guifg=darkslateblue
	    highlight default hlLevel6			ctermfg=darkmagenta			guifg=darkviolet
	    highlight default hlLevel7			ctermfg=red				guifg=red3
	    highlight default hlLevel8			ctermfg=darkyellow			guifg=orangered3
	    highlight default hlLevel9			ctermfg=darkgreen			guifg=orange2
	    highlight default hlLevel10			ctermfg=blue				guifg=yellow3
	    highlight default hlLevel11			ctermfg=darkmagenta			guifg=olivedrab4
	    highlight default hlLevel12			ctermfg=red				guifg=green4
	    highlight default hlLevel13			ctermfg=darkyellow			guifg=paleturquoise3
	    highlight default hlLevel14			ctermfg=darkgreen			guifg=deepskyblue4
	    highlight default hlLevel15			ctermfg=blue				guifg=darkslateblue
	endif
    elseif g:rainbow_parenthesis_color_set == "autre"
	highlight default hlLevel0			ctermfg=brown				guifg=RoyalBlue3
	highlight default hlLevel1			ctermfg=Darkblue			guifg=SeaGreen3
	highlight default hlLevel2			ctermfg=darkgray			guifg=DarkOrchid3
	highlight default hlLevel3			ctermfg=darkgreen			guifg=firebrick3
	highlight default hlLevel4			ctermfg=darkcyan			guifg=RoyalBlue3
	highlight default hlLevel5			ctermfg=darkred				guifg=SeaGreen3
	highlight default hlLevel6			ctermfg=darkmagenta			guifg=DarkOrchid3
	highlight default hlLevel7			ctermfg=brown				guifg=orange1
	highlight default hlLevel8			ctermfg=Darkblue			guifg=yellow1
	highlight default hlLevel9			ctermfg=darkgray			guifg=greenyellow
	highlight default hlevel10			ctermfg=darkgreen			guifg=green1
	highlight default hlevel11			ctermfg=darkcyan			guifg=springgreen1
	highlight default hlevel12			ctermfg=darkred				guifg=cyan1
	highlight default hlevel13			ctermfg=darkmagenta			guifg=slateblue1
	highlight default hlevel14			ctermfg=brown				guifg=magenta1
	highlight default hlevel15			ctermfg=gray				guifg=purple1
    elseif g:rainbow_parenthesis_color_set == "charlietanksley"
	highlight default hlLevel0			ctermfg=brown				guifg=RoyalBlue3
	highlight default hlLevel1			ctermfg=Darkblue			guifg=SeaGreen3
	highlight default hlLevel2			ctermfg=darkgray			guifg=DarkOrchid3
	highlight default hlLevel3			ctermfg=darkgreen			guifg=firebrick3
	highlight default hlLevel4			ctermfg=darkcyan			guifg=RoyalBlue3
	highlight default hlLevel5			ctermfg=darkred				guifg=SeaGreen3
	highlight default hlLevel6			ctermfg=darkmagenta			guifg=DarkOrchid3
	highlight default hlLevel7			ctermfg=brown				guifg=firebrick3
	highlight default hlLevel8			ctermfg=gray				guifg=RoyalBlue3
	highlight default hlLevel9			ctermfg=black				guifg=SeaGreen3
	highlight default hlevel10			ctermfg=darkmagenta			guifg=DarkOrchid3
	highlight default hlevel11			ctermfg=Darkblue			guifg=firebrick3
	highlight default hlevel12			ctermfg=darkgreen			guifg=RoyalBlue3
	highlight default hlevel13			ctermfg=darkcyan			guifg=SeaGreen3
	highlight default hlevel14			ctermfg=darkred				guifg=DarkOrchid3
	highlight default hlevel15			ctermfg=red				guifg=firebrick3
    elseif g:rainbow_parenthesis_color_set == "jwilkins"
	highlight default hlLevel0			ctermfg=brown	    guibg=WhiteSmoke	guifg=RoyalBlue3
	highlight default hlLevel1			ctermfg=Darkblue    guibg=WhiteSmoke	guifg=SeaGreen3
	highlight default hlLevel2			ctermfg=darkgray    guibg=WhiteSmoke	guifg=DarkOrchid3
	highlight default hlLevel3			ctermfg=darkgreen   guibg=WhiteSmoke	guifg=firebrick3
	highlight default hlLevel4			ctermfg=darkcyan    guibg=AntiqueWhite	guifg=RoyalBlue3
	highlight default hlLevel5			ctermfg=darkred     guibg=AntiqueWhite	guifg=SeaGreen3
	highlight default hlLevel6			ctermfg=darkmagenta guibg=AntiqueWhite	guifg=DarkOrchid3
	highlight default hlLevel7			ctermfg=brown	    guibg=AntiqueWhite	guifg=firebrick3
	highlight default hlLevel8			ctermfg=gray	    guibg=LemonChiffon	guifg=RoyalBlue3
	highlight default hlLevel9			ctermfg=black	    guibg=LemonChiffon	guifg=SeaGreen3
	highlight default hlevel10			ctermfg=darkmagenta guibg=LemonChiffon	guifg=DarkOrchid3
	highlight default hlevel11			ctermfg=Darkblue    guibg=LemonChiffon	guifg=firebrick3
	highlight default hlevel12			ctermfg=darkgreen   guibg=AliceBlue	guifg=RoyalBlue3
	highlight default hlevel13			ctermfg=darkcyan    guibg=AliceBlue	guifg=SeaGreen3
	highlight default hlevel14			ctermfg=darkred     guibg=AliceBlue	guifg=DarkOrchid3
	highlight default hlevel15			ctermfg=red	    guibg=AliceBlue	guifg=firebrick3
    else
	highlight default hlLevel0 ctermbg=LightGray	ctermfg=brown	    guibg=WhiteSmoke	guifg=RoyalBlue3
	highlight default hlLevel1 ctermbg=LightGray	ctermfg=Darkblue    guibg=WhiteSmoke	guifg=SeaGreen3
	highlight default hlLevel2 ctermbg=LightGray	ctermfg=darkgray    guibg=WhiteSmoke	guifg=DarkOrchid3
	highlight default hlLevel3 ctermbg=LightGray	ctermfg=darkgreen   guibg=WhiteSmoke	guifg=firebrick3
	highlight default hlLevel4 ctermbg=LightGray	ctermfg=darkcyan    guibg=AntiqueWhite	guifg=RoyalBlue3
	highlight default hlLevel5 ctermbg=LightGray	ctermfg=darkred	    guibg=AntiqueWhite	guifg=SeaGreen3
	highlight default hlLevel6 ctermbg=LightGray	ctermfg=darkmagenta guibg=AntiqueWhite	guifg=DarkOrchid3
	highlight default hlLevel7 ctermbg=LightGray	ctermfg=gray	    guibg=AntiqueWhite	guifg=firebrick3
	highlight default hlLevel8 ctermbg=LightGray	ctermfg=brown	    guibg=LemonChiffon	guifg=RoyalBlue3
	highlight default hlLevel9 ctermbg=LightGray	ctermfg=Darkblue    guibg=LemonChiffon	guifg=SeaGreen3
	highlight default hlevel10 ctermbg=LightGray	ctermfg=darkgray    guibg=LemonChiffon	guifg=DarkOrchid3
	highlight default hlevel11 ctermbg=LightGray	ctermfg=darkgreen   guibg=LemonChiffon	guifg=firebrick3
	highlight default hlevel12 ctermbg=LightGray	ctermfg=darkcyan    guibg=AliceBlue	guifg=RoyalBlue3
	highlight default hlevel13 ctermbg=LightGray	ctermfg=darkred	    guibg=AliceBlue	guifg=SeaGreen3
	highlight default hlevel14 ctermbg=LightGray	ctermfg=darkmagenta guibg=AliceBlue	guifg=DarkOrchid3
	highlight default hlevel15 ctermbg=LightGray	ctermfg=gray	    guibg=AliceBlue	guifg=firebrick3
    endif

    syntax cluster rainbow_parenthesis contains=hlLevel0,hlLevel1,hlLevel2,hlLevel3,hlLevel4,hlLevel5,hlLevel6,hlLevel7,hlLevel8,hlLevel9

    let rainbow_parenthesis#active = 1
endfunction rainbow_parenthesis#Activate
" }}} 1

function rainbow_parenthesis#Clear()
    let i = 0
    while i != 16
	exe 'highlight clear hlLevel' . i
	let i = i + 1
    endwhile
    let rainbow_parenthesis#active = 0
endfunction rainbow_parenthesis#Clear()

function rainbow_parenthesis#Toggle ()
    if ! exists('rainbow_parenthesis#active')
	call rainbow_parenthesis#LoadRound ()
	let rainbow_parenthesis#active = 0
    endif
    if rainbow_parenthesis#active != 0
	call rainbow_parenthesis#Clear ()
    else
	call rainbow_parenthesis#Activate ()
    endif
endfunction rainbow_parenthesis#Toggle

" Section: syntax {{{1
"
" Subsection: parentheses or round brackets: {{{2
"
function rainbow_parenthesis#LoadRound ()
    syntax match ParenError display ')'
    syntax region Paren0 transparent matchgroup=hlLevel0  start='(' end=')' contains=TOP containedin=TOP,Paren15
    syntax region Paren1 transparent matchgroup=hlLevel1  start='(' end=')' contains=TOP containedin=Paren0  contained
    syntax region Paren2 transparent matchgroup=hlLevel2  start='(' end=')' contains=TOP containedin=Paren1  contained
    syntax region Paren3 transparent matchgroup=hlLevel3  start='(' end=')' contains=TOP containedin=Paren2  contained
    syntax region Paren4 transparent matchgroup=hlLevel4  start='(' end=')' contains=TOP containedin=Paren3  contained
    syntax region Paren5 transparent matchgroup=hlLevel5  start='(' end=')' contains=TOP containedin=Paren4  contained
    syntax region Paren6 transparent matchgroup=hlLevel6  start='(' end=')' contains=TOP containedin=Paren5  contained
    syntax region Paren7 transparent matchgroup=hlLevel7  start='(' end=')' contains=TOP containedin=Paren6  contained
    syntax region Paren8 transparent matchgroup=hlLevel8  start='(' end=')' contains=TOP containedin=Paren7  contained
    syntax region Paren9 transparent matchgroup=hlLevel9  start='(' end=')' contains=TOP containedin=Paren8  contained
    syntax region Paren0 transparent matchgroup=hlLevel10 start='(' end=')' contains=TOP containedin=Paren9  contained
    syntax region Paren1 transparent matchgroup=hlLevel11 start='(' end=')' contains=TOP containedin=Paren10 contained
    syntax region Paren2 transparent matchgroup=hlLevel12 start='(' end=')' contains=TOP containedin=Paren11 contained
    syntax region Paren3 transparent matchgroup=hlLevel13 start='(' end=')' contains=TOP containedin=Paren12 contained
    syntax region Paren4 transparent matchgroup=hlLevel14 start='(' end=')' contains=TOP containedin=Paren13 contained
    syntax region Paren5 transparent matchgroup=hlLevel15 start='(' end=')' contains=TOP containedin=Paren14 contained
    syntax cluster rainbow_parenthesis contains=hlLevel0,hlLevel1,hlLevel2,hlLevel3,hlLevel4,hlLevel5,hlLevel6,hlLevel7,hlLevel8,hlLevel9,hlLevel10,hlLevel11,hlLevel12,hlLevel13,hlLevel14,hlLevel15
    highlight link ParenError Error
    let rainbow_parenthesis#active = 0
endfunction rainbow_parenthesis#LoadRound " }}}2

" Subsection: box brackets or square brackets: {{{2
"
function rainbow_parenthesis#LoadSquare ()
    syntax match ParenError display ']'
    syntax region Paren0 transparent matchgroup=hlLevel0  start='\[' end=']' contains=TOP containedin=TOP,Paren15
    syntax region Paren1 transparent matchgroup=hlLevel1  start='\[' end=']' contains=TOP containedin=Paren0 contained
    syntax region Paren2 transparent matchgroup=hlLevel2  start='\[' end=']' contains=TOP containedin=Paren1 contained
    syntax region Paren3 transparent matchgroup=hlLevel3  start='\[' end=']' contains=TOP containedin=Paren2 contained
    syntax region Paren4 transparent matchgroup=hlLevel4  start='\[' end=']' contains=TOP containedin=Paren3 contained
    syntax region Paren5 transparent matchgroup=hlLevel5  start='\[' end=']' contains=TOP containedin=Paren4 contained
    syntax region Paren6 transparent matchgroup=hlLevel6  start='\[' end=']' contains=TOP containedin=Paren5 contained
    syntax region Paren7 transparent matchgroup=hlLevel7  start='\[' end=']' contains=TOP containedin=Paren6 contained
    syntax region Paren8 transparent matchgroup=hlLevel8  start='\[' end=']' contains=TOP containedin=Paren7 contained
    syntax region Paren9 transparent matchgroup=hlLevel9  start='\[' end=']' contains=TOP containedin=Paren8 contained
    syntax region Paren0 transparent matchgroup=hlLevel10 start='\[' end=']' contains=TOP containedin=Paren9 contained
    syntax region Paren1 transparent matchgroup=hlLevel11 start='\[' end=']' contains=TOP containedin=Paren10 contained
    syntax region Paren2 transparent matchgroup=hlLevel12 start='\[' end=']' contains=TOP containedin=Paren11 contained
    syntax region Paren3 transparent matchgroup=hlLevel13 start='\[' end=']' contains=TOP containedin=Paren12 contained
    syntax region Paren4 transparent matchgroup=hlLevel14 start='\[' end=']' contains=TOP containedin=Paren13 contained
    syntax region Paren5 transparent matchgroup=hlLevel15 start='\[' end=']' contains=TOP containedin=Paren14 contained
    syntax cluster rainbow_parenthesis contains=hlLevel0,hlLevel1,hlLevel2,hlLevel3,hlLevel4,hlLevel5,hlLevel6,hlLevel7,hlLevel8,hlLevel9,hlLevel10,hlLevel11,hlLevel12,hlLevel13,hlLevel14,hlLevel15
    highlight link ParenError Error
    let rainbow_parenthesis#active = 0
endfunction rainbow_parenthesis#LoadSquare " }}}2

" Subsection: curly brackets or braces: {{{2
"
function rainbow_parenthesis#LoadBraces ()
    syntax match ParenError display '}'
    syntax region Paren0 transparent matchgroup=hlLevel0  start='{' end='}' contains=TOP containedin=TOP,Paren15
    syntax region Paren1 transparent matchgroup=hlLevel1  start='{' end='}' contains=TOP containedin=Paren0 contained
    syntax region Paren2 transparent matchgroup=hlLevel2  start='{' end='}' contains=TOP containedin=Paren1 contained
    syntax region Paren3 transparent matchgroup=hlLevel3  start='{' end='}' contains=TOP containedin=Paren2 contained
    syntax region Paren4 transparent matchgroup=hlLevel4  start='{' end='}' contains=TOP containedin=Paren3 contained
    syntax region Paren5 transparent matchgroup=hlLevel5  start='{' end='}' contains=TOP containedin=Paren4 contained
    syntax region Paren6 transparent matchgroup=hlLevel6  start='{' end='}' contains=TOP containedin=Paren5 contained
    syntax region Paren7 transparent matchgroup=hlLevel7  start='{' end='}' contains=TOP containedin=Paren6 contained
    syntax region Paren8 transparent matchgroup=hlLevel8  start='{' end='}' contains=TOP containedin=Paren7 contained
    syntax region Paren9 transparent matchgroup=hlLevel9  start='{' end='}' contains=TOP containedin=Paren8 contained
    syntax region Paren0 transparent matchgroup=hlLevel10 start='{' end='}' contains=TOP containedin=Paren9 contained
    syntax region Paren1 transparent matchgroup=hlLevel11 start='{' end='}' contains=TOP containedin=Paren10 contained
    syntax region Paren2 transparent matchgroup=hlLevel12 start='{' end='}' contains=TOP containedin=Paren11 contained
    syntax region Paren3 transparent matchgroup=hlLevel13 start='{' end='}' contains=TOP containedin=Paren12 contained
    syntax region Paren4 transparent matchgroup=hlLevel14 start='{' end='}' contains=TOP containedin=Paren13 contained
    syntax region Paren5 transparent matchgroup=hlLevel15 start='{' end='}' contains=TOP containedin=Paren14 contained
    highlight link ParenError Error
    syntax cluster rainbow_parenthesis contains=hlLevel0,hlLevel1,hlLevel2,hlLevel3,hlLevel4,hlLevel5,hlLevel6,hlLevel7,hlLevel8,hlLevel9,hlLevel10,hlLevel11,hlLevel12,hlLevel13,hlLevel14,hlLevel15
    let rainbow_parenthesis#active = 0
endfunction  rainbow_parenthesis#LoadBraces " }}}2

" Subsection: angle brackets or chevrons: {{{2
"
function rainbow_parenthesis#LoadChevrons ()
    syntax match ParenError display '>'
    syntax region Paren0 transparent matchgroup=hlLevel0  start='<' end='>' contains=TOP containedin=TOP,Paren15
    syntax region Paren1 transparent matchgroup=hlLevel1  start='<' end='>' contains=TOP containedin=Paren0 contained
    syntax region Paren2 transparent matchgroup=hlLevel2  start='<' end='>' contains=TOP containedin=Paren1 contained
    syntax region Paren3 transparent matchgroup=hlLevel3  start='<' end='>' contains=TOP containedin=Paren2 contained
    syntax region Paren4 transparent matchgroup=hlLevel4  start='<' end='>' contains=TOP containedin=Paren3 contained
    syntax region Paren5 transparent matchgroup=hlLevel5  start='<' end='>' contains=TOP containedin=Paren4 contained
    syntax region Paren6 transparent matchgroup=hlLevel6  start='<' end='>' contains=TOP containedin=Paren5 contained
    syntax region Paren7 transparent matchgroup=hlLevel7  start='<' end='>' contains=TOP containedin=Paren6 contained
    syntax region Paren8 transparent matchgroup=hlLevel8  start='<' end='>' contains=TOP containedin=Paren7 contained
    syntax region Paren9 transparent matchgroup=hlLevel9  start='<' end='>' contains=TOP containedin=Paren8 contained
    syntax region Paren0 transparent matchgroup=hlLevel10 start='<' end='>' contains=TOP containedin=Paren9 contained
    syntax region Paren1 transparent matchgroup=hlLevel11 start='<' end='>' contains=TOP containedin=Paren10 contained
    syntax region Paren2 transparent matchgroup=hlLevel12 start='<' end='>' contains=TOP containedin=Paren11 contained
    syntax region Paren3 transparent matchgroup=hlLevel13 start='<' end='>' contains=TOP containedin=Paren12 contained
    syntax region Paren4 transparent matchgroup=hlLevel14 start='<' end='>' contains=TOP containedin=Paren13 contained
    syntax region Paren5 transparent matchgroup=hlLevel15 start='<' end='>' contains=TOP containedin=Paren14 contained
    syntax cluster rainbow_parenthesis contains=hlLevel0,hlLevel1,hlLevel2,hlLevel3,hlLevel4,hlLevel5,hlLevel6,hlLevel7,hlLevel8,hlLevel9
    highlight link ParenError Error
    let rainbow_parenthesis#active = 0
endfunction rainbow_parenthesis#LoadChevrons " }}}2

" }}}1
finish

"------------------------------------------------------------------------------
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab textwidth=0 :
" vim: set fileencoding=utf-8 filetype=vim foldmethod=marker spell spelllang=en_gb:
