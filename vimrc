" --------------------------------------------------------------------------------------- "
"             vimrc file                                                                  "
" --------------------------------------------------------------------------------------- "
syntax on                       " enable syntax highlighting
colorscheme wombat              " colorscheme
set number                      " numbers at left
set ruler                       " show cursor line and column in the status line
set showmatch                   " show matching brackets and change on %
set magic                       " changes special characters in search patterns (default)
set nocompatible                " get easier to use and more user friendly vim defaults
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set wildmode=longest,list,full  " bash-like expanding
set wildmenu
set noesckeys                   " single <Esc> is recognized immediatly
set smartindent                 " smart indenting
set shiftwidth=2                " number of spaces for (auto)indent
set tabstop=2                   " number of spaces a tab counts for
set expandtab                   " spaces instead of tabbing
set undofile                    " use an undo-file and give the path where to save
set undodir=/home/jklee/.vimundo/

" make trailing whitespace annoyingly highlighted
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
                                " show trailing whitespaces when entering
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
                                " trailing whitespace, except when typing
                                " at the end of a line
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
                                " show trailing whitespaces when leaving insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" latex-suite configurations
filetype plugin on              " invoke latex-suite when opening .tex-file
set grepprg=grep\ -nH\ $*       " prevent grep to skip displaying the file name
