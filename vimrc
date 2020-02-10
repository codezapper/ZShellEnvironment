call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'idanarye/vim-vebugger'
Plug 'benmills/vimux'
Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'junegunn/limelight.vim'
Plug 'davidhalter/jedi-vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

let python_highlight_all=1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:easytags_events = ['BufWritePost']

let g:limelight_conceal_ctermfg = 'gray'
" let g:limelight_conceal_ctermfg=240
let g:limelight_conceal_guifg = 'DarkGray'
" let g:limelight_conceal_guifg = '#777777'
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 1
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
" let g:limelight_priority = -1
" 
" " Color name (:help cterm-colors) or ANSI code
" let g:limelight_conceal_ctermfg = 100
" 
" " Color name (:help gui-colors) or RGB color
" let g:limelight_conceal_guifg = '#83a598'

let g:vim_markdown_folding_disabled = 1

syntax on

nnoremap <C-t> :Files
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <F5>  :VBGstartPDB3 %
nnoremap <F6>  :VBGcontinue
nnoremap <F8>  :VBGtoggleBreakpointThisLine
nnoremap <F10> :VBGstepOver
nnoremap <F11> :VBGstepIn
nnoremap <S-E> :VBGevalSelectedText

vmap <leader>( o<ESC>i(<ESC>gvo<ESC>a)<ESC>
vmap <leader>[ o<ESC>i[<ESC>gvo<ESC>a]<ESC>
vmap <leader>{ o<ESC>i{<ESC>gvo<ESC>a}<ESC>
vmap <leader>' o<ESC>i'<ESC>gvo<ESC>a'<ESC>
vmap <leader>" o<ESC>i"<ESC>gvo<ESC>a"<ESC>

au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

highlight Pmenu ctermfg=15 ctermbg=8 guifg=#ffffff guibg=gray
highlight PmenuSel ctermfg=15 ctermbg=0 guifg=#ffffff guibg=black
highlight BadWhitespace ctermbg=red guibg=red
highlight LineNr ctermbg=0 ctermfg=12
highlight CursorLine cterm=NONE ctermbg=darkgray
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8
set ignorecase
set splitright
set backspace=indent,eol,start
set number
set laststatus=2
set statusline=%#Pmenu#%{FugitiveStatusline()}
set statusline+=%#LineNr#\ %F
set cursorline
