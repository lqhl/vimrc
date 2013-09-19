" set local leader
let maplocalleader = '\'

" set color scheme
colorscheme solarized

" vim-viki options
let g:vikiHomePage = '~/Dropbox/notes/index.viki'
let g:vikiOpenUrlWith_mailto = 'silent !firefox %{URL}'
let g:vikiOpenUrlWith_http   = 'silent !firefox %{URL}'
let g:vikiOpenUrlWith_ANY    = 'silent !firefox %{URL}'
let g:vikiOpenFileWith_html  = 'silent !firefox %{FILE}'
let g:vikiOpenFileWith_ANY   = 'silent !start %{FILE}'

" VOoM options
let g:voom_ft_modes = {'viki': 'viki', 'python': 'python', 'markdown': 'markdown'}
au BufNewFile,BufRead *.viki set filetype=viki

" folding options
set foldmethod=syntax
" add folding capability to C-style comments
au BufNewFile,BufRead *.cpp,*.c,*.h,*.java syn region myCComment start="/\*" end="\*/" fold keepend transparent
" the following function keep the "/*" beginning of the comment in the folded text
set foldtext=MyFoldText()
function! MyFoldText()
    let line = getline(v:foldstart)
    let sub = substitute(line, '^[\t ]*', '', '')
    let nlines = v:foldend - v:foldstart + 1
    if strlen(nlines) == 1
        let nlines = " " . nlines
    elseif strlen(nlines) == 2
        let nlines = " " . nlines
    endif
    return "+-" . v:folddashes . nlines . ": " . sub
endfunction
" open all folds
set foldlevel=100


" tags
set tags=./tags;/

" Disable commands for creating and deleting folds.
noremap zf <Nop>
noremap zF <Nop>
noremap zd <Nop>
noremap zD <Nop>
noremap zE <Nop>

" case-insensitive filename completion
set wildignorecase

" CSCOPE settings
source ~/.vim_runtime/cscope_maps.vim

" MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

set textwidth=80

" Chinese support
set fileencodings=utf-8,gb2312,gbk

" Toggle Ctags window
noremap <silent> <C-g> :TlistToggle<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Make Y behave like other capitals
map Y y$

" Clear search highlights
noremap <silent><Leader>/ :nohls<CR>

" automatically reload vimrc when it's saved
au BufWritePost my_configs.vim so ~/.vimrc

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
