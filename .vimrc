set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent
set ignorecase
set smartcase
set relativenumber
set number
set title
set hidden
set noswapfile
set path=.,**
set splitright
set showtabline=2
set nowrap
set mouse=nicr
set shortmess+=aIc
set formatoptions-=ato2
set formatoptions+=cqrnj
set completeopt=menuone,noselect,noinsert
set pumheight=15
set signcolumn=yes
set updatetime=250
set scrolloff=8
set sidescrolloff=15
set noshowmode
set wildmenu
set wildcharm=<C-z>
set wildmode=longest,full
set wildoptions=pum
set foldlevelstart=99
set foldmethod=indent
set termguicolors
set lazyredraw
set breakindent
set showbreak='↳'
set colorcolumn=80,120
set incsearch

set wildignore+=*/.git/*
set wildignore+=*/.DS_Store
set wildignore+=*/.vscode/*
set wildignore+=*/node_modules/*
set wildignore+=*/__pycache__/*
set wildignore+=*/venv/*
set wildignore+=*/.cache/*
set wildignore+=*/.settings/*,
set wildignore+=*/target/*

" %m: File mode (e.g., "--" for normal mode, "R" for read-only).
" %r: "[+]" if the file has been modified, otherwise nothing.
" %h: "[h]" if there are unsaved changes, otherwise nothing.
" %w: "[w]" if there are unwritten changes, otherwise nothing.
" %y: "[d]" if there's a difference to the original file, otherwise nothing.
" %=: Separator to align the right side of the statusline.
" %-14.: Aligns the following section to the right with a maximum width of 14 characters.
" (%{&ff}\ %): File format followed by a space.
"set statusline=%f\ %m%r%h%w%y%=%-14.(%{&ff}\ %)\ %l/%L\ %c
"

" %f Path to the file in the buffer, as typed or relative to current
" %m Modified flag, text is "[+]"; "[-]" if 'modifiable' is off.
" %r Readonly flag, text is "[RO]"
" %y Type of file in the buffer
set statusline=%<%f\ %m\ %r\ %y
set statusline+=%=
set statusline+=\ ℓ:%l/%L
set statusline+=\ 𝚌:%2v/%-2{virtcol('$')-1}
set statusline+=\ %p%%

let mapleader = " "

" set background=light
syntax on
" industry darkblue torte
" colorscheme slate

" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim


" hi! Normal guibg=NONE ctermbg=NONE
" hi! EndOfBuffer guibg=NONE ctermbg=NONE

let g:netrw_winsize = 15
let g:netrw_banner = 0
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_liststyle = 3
let g:netrw_altv = 1
" use the previous window to open file
let g:netrw_browse_split = 4
hi! link netrwMarkFile Search

nnoremap <C-n> :Lexplore<CR>

" Open directory of current file
nnoremap <leader>. :Sexplore %:p:h<CR>
nnoremap <leader>/ :Sexplore<CR>

autocmd FileType netrw nnoremap <buffer> l <Plug>NetrwLocalBrowseCheck
" autocmd FileType netrw nmap <buffer>  l o
autocmd FileType netrw nnoremap <buffer> - <Plug>NetrwBrowseUpDir
autocmd FileType netrw nnoremap <buffer> h <Plug>NetrwBrowseUpDir
autocmd FileType netrw nmap <buffer> I gh

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()


nnoremap <C-p> :find *

nnoremap <leader>fn :e %:h<C-z>

nnoremap <leader>w :write<CR>
nnoremap <leader>qq :q!<CR>
nnoremap <leader>qa :qa!<CR>
nnoremap Y y$
nnoremap <BS> <C-^>

nnoremap <C-j> <C-w>w
nnoremap <C-k> <C-w>W

nnoremap Q "_

vnoremap < <gv
vnoremap > >gv

cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>

" Permanent magic
nnoremap / /\v
vnoremap / /\v

" Toggles
nnoremap <silent> yow :set wrap!<CR>
