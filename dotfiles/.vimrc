" try to install packages with vundle
" and set appropriate variables
try
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'davidhalter/jedi-vim'
    Plugin 'dense-analysis/ale'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'joshdick/onedark.vim'
    Plugin 'junegunn/fzf'
    Plugin 'junegunn/fzf.vim'
    Plugin 'tpope/vim-unimpaired'
    Plugin 'vim-airline/vim-airline'
    call vundle#end()

    if !exists("g:os")
        if has("win64") || has("win32") || has("win16")
            let g:os = "Windows"
        else
            let g:os = substitute(system('uname'), '\n', '', '')
        endif
    endif

	if executable('rg')
		set grepprg=rg\ --vimgrep
		set grepformat=%f:%l:%c:%m
	endif

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_tab_nr = 1
    let g:airline#extensions#tabline#tab_nr_type = 1
    let g:airline#extensions#tabline#formatter = 'default'
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#fnametruncate = 16
    let g:airline#extensions#tabline#fnamecollapse = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1

    let mapleader=","
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    nmap <leader>h <Plug>AirlineSelectPrevTab
    nmap <leader>l <Plug>AirlineSelectNextTab

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

" Easy access to fzf.vim commands
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <Leader>g :GitFiles?<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap gw :grep <cword> . <CR>