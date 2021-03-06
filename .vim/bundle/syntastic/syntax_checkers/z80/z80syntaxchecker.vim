"============================================================================
"File:        z80.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Romain Giot <giot.romain at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists("g:loaded_syntastic_z80_z80syntaxchecker_checker")
    finish
endif
let g:loaded_syntastic_z80_z80syntaxchecker_checker=1

"bail if the user doesnt have z80_syntax_checker.py installed
"To obtain this application there are two solutions:
" - Install this python package: https://github.com/rgiot/pycpcdemotools
" - Copy/paste this script in your search path: https://raw.github.com/rgiot/pycpcdemotools/master/cpcdemotools/source_checker/z80_syntax_checker.py
function! SyntaxCheckers_z80_z80syntaxchecker_IsAvailable()
    return executable("z80_syntax_checker.py")
endfunction

function! SyntaxCheckers_z80_z80syntaxchecker_GetLocList()
    let makeprg = syntastic#makeprg#build({ 'exe': 'z80_syntax_checker.py' })
    let errorformat =  '%f:%l %m' 
    let loclist = SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
    return loclist
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'z80',
    \ 'name': 'z80syntaxchecker'})
