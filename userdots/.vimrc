" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" General configurations
syntax on
filetype plugin indent on

set undofile undodir=~/.vim/.undo undolevels=5000           " undo
set nohlsearch incsearch ignorecase smartcase               " search
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8    " encoding
set autoindent smartindent                                  " indentation
set backspace=indent,eol,start                              " sane backspace
set spell spelllang=en_us spellfile=~/.vim/spell.add        " spell checking
set tabstop=4 shiftwidth=4 expandtab                        " prefer 4-space tabs
set foldmethod=indent                                       " enable indent-folding
set dictionary+="/usr/share/dict/words"                     " add English to the vocab
set number                                                  " show line numbers on the left
set mousemodel=popup                                        " right-click pops up context menu
set fileformats=unix,dos,mac                                " support all three, in this order
set list listchars=tab:»\ ,trail:·,precedes:<,extends:>     " show tabs and trailing whitespace
set ruler                                                   " show cursor position in status bar
set mouse=a                                                 " enable mouse for all modes settings
set nocursorline nocursorcolumn                             " disable both cursor line and column
set modeline                                                " allow per-file settings via modeline
set hidden                                                  " don't unload buffer when switching away
set nomousehide                                             " don't hide the mouse cursor while typing
set title                                                   " make the xterm inherit the title from Vim
set showmatch                                               " show matching parenthesis/brackets/braces
set clipboard=unnamedplus                                   " use the system clipboard for yank/put/delete
set nocompatible                                            " prevent vim from emulating vi's bugs and limitations
set scrolloff=10                                            " scroll the window to always see 10 lines around the cursor

" Colors
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="low"
colorscheme solarized

hi LineNr ctermbg=none ctermfg=darkgreen
hi Identifier ctermfg=yellow
hi Normal ctermfg=gray
hi Visual cterm=reverse ctermfg=none ctermbg=none
hi Operator ctermfg=green
hi CursorLineNr ctermfg=darkyellow
hi CursorLine cterm=bold ctermfg=none ctermbg=none
hi CursorColumn cterm=bold ctermfg=none ctermbg=none
hi OverLength ctermbg=none ctermfg=darkred cterm=underline
hi colorcolumn ctermbg=none ctermfg=darkred cterm=underline

" Offer two ways of over-length detection (over 80th column)
" Set 'g:overlength_native_method' to either '1' (to use colorcolumn) or '0' (custom)
let g:overlength_native_method = 0

if exists("+colorcolumn") && exists("g:overlength_native_method") && g:overlength_native_method == 1
    match
    set colorcolumn=81
elseif !exists("+colorcolumn")
    match OverLength /\%>81v.\+/
else
    set colorcolumn=0
    match OverLength /\%>81v.\+/
endif

" Auto-reload vimrc
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC so $MYVIMRC
augroup END

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Retain the visual selection after indenting lines
vnoremap > >gv
vnoremap < <gv

" Tip #750: http://vim.wikia.com/wiki/VimTip750
" Underline the current line.
nnoremap <F9> yyp<c-v>$r-
inoremap <F9> <esc>yyp<c-v>$r-A

" Navigate splits with Tab.
nmap <Tab> <C-W>w
nmap <S-Tab> <C-W>w

" Sort based on line length, shorter lines followed by longer ones
" http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
function! SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction

" NeoComplCache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 100
let g:neocomplcache_max_keyword_width = 50
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_manual_completion_start_length = 2
let g:neocomplcache_min_keyword_length = 3
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_wildcard = 1
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_enable_auto_delimiter = 0
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_caching_message = 1
let g:neocomplcache_disable_auto_complete = 0
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

augroup neocomplcache_omni
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CommpleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

