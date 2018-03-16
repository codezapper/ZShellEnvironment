set rtp+=~/.fzf
set pastetoggle=<F2>

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'w0rp/ale'
Plug 'davidhalter/jedi-vim'
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'Chiel92/vim-autoformat'
Plug 'SirVer/ultisnips'
Plug 'chrisbra/csv.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'python-mode/python-mode'
Plug 'idanarye/vim-vebugger'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
call plug#end()

set termguicolors
colorscheme gruvbox
"set background=dark

let ayucolor="light"

let g:ale_linters = {'python': ['flake8'],}
let g:jedi#use_tabs_not_buffers = 1
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1


" CTRL-Tab is next tab
noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
noremap <C-S-Tab> :<C-U>tabprevious<CR>
inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
cnoremap <C-S-Tab> <C-C>:tabprevious<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-Up> :tabprevious<CR>
nnoremap <C-Down> :tabnext<CR>

noremap  :Files
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"if &ft == 'java'
"	nnoremap <F5> :call vebugger#jdb#start(expand('%:r'),{})<CR>
"endif
autocmd BufNewFile,BufRead *.java nnoremap <F5> :call vebugger#jdb#start(expand('%:r'),{})<CR>
autocmd BufNewFile,BufRead *.py nnoremap <F5> :call call vebugger#pdb#start(@%,{})<CR>
nnoremap <F6> :VBGcontinue<CR>
nnoremap <F9> :VBGtoggleBreakpointThisLine<CR>
nnoremap <F10> :VBGstepOut<CR>
nnoremap <F11> :VBGstepIn<CR>

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  " case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nocompatible
set hidden

filetype plugin indent on

hi CtrlSpaceNormal guifg=#e6db74 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
hi CtrlSpaceSelected guifg=#ee0000 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
" hi link CtrlSpaceSelected PMenuSel
hi link CtrlSpaceSearch   IncSearch
hi link CtrlSpaceStatus   StatusLine

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Open every file in its own tab
au BufAdd,BufNewFile * nested tab sball

let g:formatterpath = ['/home/tweed/tweed/TWHperlkit/root/bin/']
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<C-K>"
let g:UltiSnipsListSnippets="<C-S-K>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

let g:vebugger_use_tags=1

autocmd BufWritePost * exe ":UpdateTags"
