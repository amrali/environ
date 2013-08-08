setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal omnifunc=syntaxcomplete#Complete

" Tagbar
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '--include-vars',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

" Toggle compilation window
nmap <F3> :call ToggleCompileWindow()<CR>
let b:compile_window = 0
function! ToggleCompileWindow()
    if( b:compile_window == 0 )
        CoffeeCompile watch vert
        let b:compile_window = 1
    else
        CoffeeCompile unwatch
        let b:compile_window = 0
    endif
endfunction

