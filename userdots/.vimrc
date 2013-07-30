" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

set undofile undodir=~/.vim/.undo undolevels=5000           " undo
set nohlsearch incsearch ignorecase smartcase               " search
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8    " encoding
set wildmenu wildmode=longest,list                          " completion
set autoindent smartindent                                  " indentation
set backspace=indent,eol,start                              " sane backspace
set tabstop=4 shiftwidth=4 expandtab                        " prefer 4-space tabs
set number                                                  " show line numbers on the left
set mousemodel=popup                                        " right-click pops up conext menu
set fileformats=unix,dos,mac                                " support all three, in this order
set list listchars=tab:»\ ,trail:·,precedes:<,extends:>     " show tabs and trailing whitespace
set ruler                                                   " show cursor position in status bar
set mouse=a                                                 " enable mouse for all modes settings
set modeline                                                " allow per-file settings via modeline
set hidden                                                  " don't unload buffer when switching away
set nomousehide                                             " don't hide the mouse cursor while typing
set title                                                   " make the xterm inherit the title from Vim
set showmatch                                               " show matching parenthesis/brackets/braces
set clipboard=unnamedplus                                   " use the system clipboard for yank/put/delete
set nocompatible                                            " prevent vim from emulating vi's bugs and limitations
set scrolloff=10                                            " scroll the window to always see 10 lines around the cursor
set nocursorline nocursorcolumn                             " disable both cursor line and column

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

" Auto-reload vimrc
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
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

