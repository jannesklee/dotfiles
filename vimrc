" --------------------------------------------------------------------------------------- "
"             vimrc file                                                                  "
" --------------------------------------------------------------------------------------- "
set nocompatible                " be iMproved, required
filetype off                    " required for vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'   " let Vundle manage Vundle, required


" ----------------------- Plugins ------------------------------------------------------- "
Plugin 'lervag/vimtex'          " plugin for latex environment
Plugin 'scrooloose/nerdtree'    " a tree explorer plugin for
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'     " a Git wrapper so awesome, it should be illegal
Plugin 'scrooloose/syntastic'   " Syntax checking hacks for vim
Plugin 'bling/vim-airline'      " lean & mean status/tabline for vim that's light as air
Plugin 'bronson/vim-trailing-whitespace' " highlights trailing whitspaces red
Plugin 'ctrlpvim/ctrlp.vim'     " handle buffers nicely
Plugin 'SirVer/ultisnips'       " Track the engine.
Plugin 'honza/vim-snippets'     " Engine
Plugin 'majutsushi/tagbar'      " creates tags of functions on a sidebar

" --------------------------------------------------------------------------------------- "


" all of your Plugins must be added before the following line
call vundle#end()               " required
filetype plugin indent on       " required


syntax on                       " enable syntax highlighting
set background=dark
colorscheme wombat              " colorscheme
set number                      " numbers at left
"set relativenumber
set ruler                       " show cursor line and column in the status line
set showmatch                   " show matching brackets and change on %
set magic                       " changes special characters in search patterns (default)
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set wildmode=longest,list,full  " bash-like expanding
set wildmenu
set noesckeys                   " single <Esc> is recognized immediatly
set smartindent                 " smart indenting
set shiftwidth=2                " number of spaces for (auto)indent
set tabstop=2                   " number of spaces a tab counts for
set wrap
set linebreak
set nolist
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
set expandtab                   " spaces instead of tabbing
"setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8
set nocompatible                " be iMproved, required
set undofile                    " use an undo-file and give the path where to save
set undodir=/home/jklee/.vimundo/

au BufNewFile,BufRead,BufEnter   tex    setlocal spell    spelllang=en_us

" make trailing whitespace annoyingly highlighted
"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/
"                                " show trailing whitespaces when entering
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"                                " trailing whitespace, except when typing
"                                " at the end of a line
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"                                " show trailing whitespaces when leaving insert mode
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()

" vim-latex files
let g:tex_flavor='latex'
let g:Tex_CompileRule_pdf = 'pdflatex --synctex=-1 -src-specials -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_ViewRule_pdf =  'okular --presentation'
let g:Tex_BibtexFlavor = 'biber'

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
"nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" show buffers as tabs (uses airline)
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" UltiSnips Configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" load NERDTree at start
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
"
" vimtex options
let g:vimtex_view_method = 'zathura'
