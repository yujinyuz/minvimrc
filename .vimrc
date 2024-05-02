" General settings
set tabstop=2                    " Number of spaces a <Tab> in the file counts for
set shiftwidth=2                 " Number of spaces to use for each step of (auto)indent
set shiftround                   " Round indent to multiple of 'shiftwidth'
set expandtab                    " Use spaces instead of tabs
set autoindent                   " Copy indent from current line when starting a new line
set ignorecase                   " Ignore case when searching
set smartcase                    " Override 'ignorecase' if search pattern contains uppercase characters
set relativenumber               " Show relative line numbers
set number                       " Show absolute line numbers
set title                        " Set the title of the window to the file name
set hidden                       " Allow switching buffers without saving
set noswapfile                   " Don't create swap files
set path=.,**                    " List of directories to search for files
set splitright                   " Split windows to the right by default
set showtabline=2                " Always show the tab line
set nowrap                       " Disable line wrapping
set mouse=nicr                   " Enable mouse support in all modes
set shortmess+=aIc               " Shorten some messages
set formatoptions-=ato2          " Don't break lines after a one-letter word
set formatoptions+=cqrnj         " Automatically format comments with textwidth
set completeopt=menuone,noselect,noinsert  " Completion options
set pumheight=15                 " Maximum number of items in the popup menu
set signcolumn=yes               " Always show the signcolumn
set updatetime=250               " Time in milliseconds before triggering CursorHold
set scrolloff=8                  " Number of lines to keep visible above and below the cursor
set sidescrolloff=15             " Number of columns to keep visible to the left and right of the cursor
set noshowmode                   " Don't show current mode
set wildmenu                     " Enhanced command line completion
set wildcharm=<C-z>              " Use <C-z> for command-line completion
set wildmode=longest,full        " Command-line completion mode
set wildoptions=pum              " Options for wildmenu completion
set foldlevelstart=99            " Don't fold by default
set foldmethod=indent            " Fold based on indent
set termguicolors                " Enable true colors
set lazyredraw                   " Wait for input after redraw
set breakindent                  " Indent wrapped lines
set showbreak='↳'                " String to show at the end of a wrapped line
set colorcolumn=80,120           " Highlight columns at 80 and 120 characters
set incsearch                    " Incremental search

" File-specific ignores
set wildignore+=*/.git/*         " Ignore .git directories
set wildignore+=*/.DS_Store      " Ignore macOS .DS_Store files
set wildignore+=*/node_modules/* " Ignore node_modules directories
set wildignore+=*/__pycache__/*  " Ignore Python bytecode cache directories
set wildignore+=*/venv/*         " Ignore virtual environment directories
set wildignore+=*/.cache/*       " Ignore cache directories
set wildignore+=*/.settings/*,   " Ignore Eclipse settings directories
set wildignore+=*/target/*       " Ignore target directories

" Statusline configuration
set statusline=%<%f\ %m\ %r\ %y  " Show file path, modified flag, readonly flag, file type
set statusline+=%=                " Right align following items
set statusline+=\ ℓ:%l/%L        " Show current line number and total number of lines
set statusline+=\ 𝚌:%2v/%-2{virtcol('$')-1} " Show current column number and total number of columns
set statusline+=\ %p%%            " Show percentage of buffer

let mapleader = " "

" set background=light
syntax on
" industry darkblue torte slate habamax
colorscheme habamax

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

" Permanent magic
nnoremap / /\v
vnoremap / /\v

" Toggles
nnoremap <silent> yow :set wrap!<CR>
