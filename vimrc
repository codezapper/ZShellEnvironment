call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'idanarye/vim-vebugger'
Plug 'benmills/vimux'
call plug#end()

let python_highlight_all=1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

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
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8
set ignorecase
set splitright
set backspace=indent,eol,start
set number

