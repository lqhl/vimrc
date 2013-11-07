" set local leader
let maplocalleader = '\'

" set color scheme
set background=dark
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

set textwidth=79

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

" set up for golang
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
if !empty($GOROOT)
    set runtimepath+=$GOROOT/misc/vim
    filetype off
    filetype plugin indent off
    filetype plugin indent on
    syntax on
endif

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
