"
" .vimrc
"
" Vim configuration resource file.  Specifies desired
" behavior for the vim editor.  Place this file at
" ~/.vimrc
"
set nocompatible "must be the first line

filetype on
filetype indent on
filetype plugin on

set laststatus=2
":set statusline=%<%f\%h%m%r%=%-10.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ col=%c%V\ totlin=%L%)\ %n%Y 


set showmode      " Tell us when we're in insert mode.
set tabstop=4     " Set the tabstop to 4 spaces
set shiftwidth=4  " Shiftwidth should match tabstop
set expandtab     " Convert tabs to  number of spaces
                  " Use :set noexpandtab to disable
set nowrap        " Do not wrap lines longer than the window
"set nowrapscan    " Do not wrap while searching
set ruler         " Show the cursor position all the time
set showmatch     " Show matching () {} etc...
set smartindent   " vim will try to help you indent your code.
set backspace=2   " Make the backspace key always work.
set ignorecase    " case insensitive
set smartcase     " use case if any caps used 
set hlsearch      " Highlight what you're searching for
set incsearch     " Do incremental searching as you type
"set paste         " fixes the indenting problem while pasting

execute pathogen#infect()
map <F2> :NERDTreeToggle
map <S-Right> :tabn
map <S-Left> :tabp

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
    syntax on
    " Change the highlight color for Comment and Special
    " to Cyan.  Blue is too dark for a black background.
    highlight Special term=bold ctermfg=6 guifg=Cyan
    highlight Comment term=bold ctermfg=Blue guifg=Cyan
    "set background=dark
    "colorscheme solarized    
endif

augroup filetypedetect
    au BufNewFile,BufRead *.json set filetype=json syntax=javascript
    au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END


" Short cut to swich CWD to dir of file in current window
map T :lcd %:h

"
" Buffer Close - custom version
" 
command! Bd call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
let l:currentBufNum = bufnr("%")
let l:alternateBufNum = bufnr("#")

if buflisted(l:alternateBufNum)
buffer #
else
bnext
endif

if bufnr("%") == l:currentBufNum
new
endif

if buflisted(l:currentBufNum)
execute("bdelete ".l:currentBufNum)
endif
endfunction

