" try to install packages with vundle
" and set appropriate variables
try
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'JuliaEditorSupport/julia-vim'
    Plugin 'davidhalter/jedi-vim'
    Plugin 'dense-analysis/ale'
    " Plugin 'eigenfoo/stan-vim'  No need for Stan support these days...
    Plugin 'joshdick/onedark.vim'
    " Plugin 'otherjoel/vim-pollen'
    Plugin 'tpope/vim-fugitive'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vimwiki/vimwiki'
    " Plugin 'wlangstroth/vim-racket'
    call vundle#end()

    if !exists("g:os")
        if has("win64") || has("win32") || has("win16")
            let g:os = "Windows"
        else
            let g:os = substitute(system('uname'), '\n', '', '')
        endif
    endif

    if g:os == "Darwin"
        let g:vimwiki_list = [{
        \   'path': '/Volumes/alexandria/',
        \   'syntax': 'markdown',
        \   'ext': '.md'
        \}]
    elseif g:os == "Linux"
        let g:vimwiki_list = [{
        \   'path': '/mnt/alexandria/',
        \   'syntax': 'markdown',
        \   'ext': '.md'
        \}]
    endif

    let g:airline#extensions#tabline#enabled = 1

    let g:ale_linters = {
    \   'python': ['flake8', 'pylint'],
    \   'julia': ['languageserver'],
    \}
    let g:ale_fixers = {
    \   'python': ['black'],
    \}
    let g:ale_lint_on_text_changed='never'
    let g:ale_linters_explicit = 1  " only run ale_linters

    let g:jedi#popup_on_dot = 0
catch
endtry

set nocompatible        " use vim settings, not vi settings

filetype plugin on      " enable filetype plugins
filetype indent on      " enable filetype indentation

set t_Co=256            " 256 bit colors
set encoding=utf8       " utf as standard encoding, en_US as standard language
set ffs=unix,dos,mac    " use unix as standard file type

set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set cursorline          " highlight current line
set laststatus=2        " always display status line
set noshowmode          " let lightline display things

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" hush sounds on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" tabbing and text width
set expandtab 
set smarttab
set tabstop=4 
set softtabstop=4
set shiftwidth=4

" indentation
set autoindent
set smartindent

" map jk and kj to Escape: hit j and k simultaneously to exit insert mode
" also, shorten timeout length
inoremap jk <Esc>
inoremap kj <Esc>
set notimeout
set ttimeout
set ttimeoutlen=10

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight searches and show incomplete matches
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <Space> :noh<CR>

" relative line numbering
set number
set relativenumber

" disable arrow keys completely
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" code folding
set foldmethod=indent  " fold code using indents: this works well for Python
set nofoldenable
set foldlevel=2
nnoremap <Space><Space> za
" visually select some lines, then space to fold. only works with foldmethod=manual 
" vnoremap <Space> zf

" scrolling offset, mouse scrolling
set scrolloff=2
if has('mouse')
    set mouse=a
endif

" split intuitively
set splitbelow
set splitright

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" apply vim patch to make comment-aware line joins
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

" syntax highlighting, background, colorscheme
syntax enable
set background=dark
try
    colorscheme onedark
catch
    colorscheme default
endtry

" show matching {[()]}, how long to blink when matching
set showmatch
set mat=2

" autocompletion
set complete=.,b,u,]
set wildmenu
set wildmode=longest,list:longest
set completeopt=menu,menuone,preview,noinsert

" keep text selected while indenting
vnoremap < <gv
vnoremap > >gv

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_list_hide= '.*\.swp$'
nnoremap <Leader>e :Vexplore<Enter>
nnoremap <Leader>se :Sexplore<Enter>
nnoremap <Leader>ve :Vexplore<Enter>

" Easy insertion of special chars
imap <C-L> λ
imap <C-E> ◊
