" --------------------------------------------------------------------------------------- "
"             vimrc file                                                                  "
" --------------------------------------------------------------------------------------- "
call plug#begin('~/.vim/plugged')

" ----------------------- Plugs ------------------------------------------------------- "
Plug 'lervag/vimtex'          " plugin for latex environment
Plug 'scrooloose/nerdtree'    " a tree explorer plugin for
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Valloric/YouCompleteMe' " Auto completion
Plug 'tpope/vim-fugitive'     " a Git wrapper so awesome, it should be illegal
Plug 'scrooloose/syntastic'   " Syntax checking hacks for vim
Plug 'bling/vim-airline'      " lean & mean status/tabline for vim that's light as air
Plug 'bronson/vim-trailing-whitespace' " highlights trailing whitspaces red
Plug 'ctrlpvim/ctrlp.vim'     " handle buffers nicely
Plug 'SirVer/ultisnips'       " Track the engine.
Plug 'honza/vim-snippets'     " Engine
Plug 'majutsushi/tagbar'      " creates tags of functions on a sidebar
Plug 'junegunn/vim-easy-align' " aligns tables etc.
Plug 'tpope/vim-markdown'     " markdown syntax
Plug 'vim-scripts/SyntaxRange' " allows for syntax highlighting in regions
Plug 'vim-scripts/Wombat'
" --------------------------------------------------------------------------------------- "
call plug#end()

syntax on                       " enable syntax highlighting
set background=dark
colorscheme wombat              " colorscheme
set number                      " numbers at left
set relativenumber
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
if version >= 703
	if !isdirectory($HOME."/.vimundo")
	  call mkdir($HOME."/.vimundo", "", 0700)
	endif
  set undofile                  " use an undo-file and give the path where to save
  set undodir=$HOME/.vimundo/
endif

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

" syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" show buffers as tabs (uses airline)
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" load NERDTree at start
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
nmap <leader>ne :NERDTree<cr>
"
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" vimtex options
let g:vimtex_view_method = 'zathura'

" copy from multiple terminals
set clipboard^=unnamed

" vimtex settings
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

"if empty(v:servername) && exists('*remote_startserver')
"  call remote_startserver('VIM')
"endif

" other colorscheme in vimdiff
if &diff
  colorscheme evening
endif
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" key to toggle tagbar
nmap <F8> :TagbarToggle<CR>
