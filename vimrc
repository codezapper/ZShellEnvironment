set nocompatible
set number

filetype off

set encoding=utf-8

" set guifont=Source\ Code\ Pro\ for\ Powerline
set guifont=Droid\ Sans\ Mono\ for\ Powerline

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" The bundles you install will be listed here

filetype plugin indent on
" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'vim-airline/vim-airline'
" Bundle 'itchyny/lightline.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
" Bundle 'ctrlpvim/ctrlp.vim'
" Bundle 'wincent/Command-T'
Bundle 'scrooloose/syntastic'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'alvan/vim-closetag'
Bundle 'Townk/vim-autoclose'
Bundle 'tmhedberg/matchit'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-surround'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'airblade/vim-gitgutter'
Bundle 'idanarye/vim-merginal'
Bundle 'rdunklau/vim-perltidy'
Bundle 'ConradIrwin/vim-bracketed-paste'

" The rest of your config follows here

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny'  }
call plug#end()

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
map <F2> :NERDTreeToggle<CR>

let g:airline_powerline_fonts = 1

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Pylint configuration file
let g:pymode_lint_config = '$HOME/.pylint.rc'

let g:pymode_options_max_line_length = 119
let g:CommandTMaxFiles=2000000

let g:Powerline_symbols = 'fancy'

syntax on
let g:solarized_termcolors=256
set background=dark
"colorscheme solarized
imap <C-BS> <C-W>
"map  :CommandT
map  :Files
map { S{
map ' S'
map " S"
map ( S(
map [ S[
map  :split<CR>
nnoremap  :vs<CR>
map <F9> :Gstatus<CR>
map <F11> :MerginalToggle<CR>
map <F12> gd
map <C-F12> gf
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

autocmd BufNewFile,BufRead *.tt setf tt2

" The Silver Searcher
if executable('ag')
  " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

set pastetoggle=<F10>
map <C-S-v> :"*yGp

