inoremap jk <Esc>
" vnoremap jk <Esc>
nnoremap <silent> ,<space> :noh<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" nnoremap <C-C> <C-E>
" nnoremap <C-E> <C-Y>

set splitbelow
set splitright

augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END
