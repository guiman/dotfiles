" No reason to limit ourselves to vi compatibility
set nocompatible

" VIM Vundle Configuration
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'jistr/vim-nerdtree-tabs.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'skwp/vim-spec-finder'
Plugin 'tpope/vim-rails.git'
Plugin 'rking/ag.vim'
Plugin 'vim-ruby/vim-ruby.git'
Plugin 'tpope/vim-commentary'
Plugin 'kchmck/vim-coffee-script'
Plugin 'airblade/vim-gitgutter'
call vundle#end()
filetype plugin indent on

" reload .vimrc automatically
autocmd! bufwritepost .vimrc source %

" Remember command line entries
set history=300

" indentation configuration
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

" show tabs and trailing spaces
set list
set listchars=tab:>-,trail:-

" Reload files when they are changed by another process.
set autoread
augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter        * silent! checktime
        autocmd CursorHold      * silent! checktime
        autocmd CursorHoldI     * silent! checktime
        "these two _may_ slow things down. Remove if they do.
        autocmd CursorMoved     * silent! checktime
        autocmd CursorMovedI    * silent! checktime
    endif
augroup END

" show trailing whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" linewidth (endless)
set textwidth=0

" do not wrap lines automatically
set nowrap

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

" remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Encoding and locale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8

" case insensitive searches
"set ignorecase
" incremental search
set incsearch
" show mode
set showmode
" show line and column information
set ruler
" show matching brackets
set showmatch
set formatoptions=tcqor
set whichwrap=b,s,<,>,[,]

" always show the tabline
set showtabline=2

" smart home
noremap  <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0'  : '^')
imap <Home> <C-o><Home>
"noremap  <expr> <End>  (col('.') == match(getline('.'),    '\s*$')   ? '$'  : 'g_')
"vnoremap <expr> <End>  (col('.') == match(getline('.'),    '\s*$')   ? '$h' : 'g_')
"imap <End>  <C-o><End>

" colorscheme
colorscheme railscasts
syntax on

" show line number
set number

" make backspace behave as normal
set backspace=indent,eol,start

highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(81,999),",")
