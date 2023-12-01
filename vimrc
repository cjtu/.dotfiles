" Setup Vundle:
" For this to work, you must install the vundle plugin manually.
" https://github.com/gmarik/vundle
" To install vundle, copy all the files from the repo into your respective
" folders within ~/.vim
set nocompatible " Disable VI... That's for grandpas.
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" Vundle plugins must be wrapped in the #begin() and #end()
call vundle#begin()
" Vundle let's you specify a plugin directly from a Git repo:
" Plugin 'githubUsername/repoName'
Plugin 'VundleVim/Vundle.vim'

" Let vundle manage itself:
Plugin 'gmarik/vundle'

" Color schemes.
" https://github.com/flazz/vim-colorschemes#current-colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'tomasiser/vim-code-dark'

" Fuzzy finder -- absolutely must have.
Plugin 'kien/ctrlp.vim'

" Support for easily toggling comments.
Plugin 'tpope/vim-commentary'

" Custom syntaxes
" I write markdown a lot. This is a good syntax.
Plugin 'tpope/vim-markdown'

call vundle#end()

" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

" Tbas as space and smart indents
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.

" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" So we don't have to reach for escape to leave insert mode.
inoremap jk <esc>
inoremap kj <esc>

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>

" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" Plugin settings:
" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine

" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30

colorscheme molokai

