inoremap jk <Esc>:w<CR>
" vnoremap jk <Esc>
nnoremap <silent> ,<space> :noh<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" nnoremap <C-C> <C-E>
" nnoremap <C-E> <C-Y>

" toggle line number
map <silent> <LocalLeader>nn :set nu!<CR>

set splitbelow
set splitright

augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END

" change insert cursor style. https://stackoverflow.com/a/42118416
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" toggle quickfix (with window history). https://learnvimscriptthehardway.stevelosh.com/chapters/38.html
nnoremap <leader>ww :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        ccl
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        cope
        let g:quickfix_is_open = 1
    endif
endfunction

" first get powerline fonts:
" linux: sudo apt-get install fonts-powerline
" osx: download and manually install *all* fonts at https://github.com/powerline/fonts/tree/master/SourceCodePro
" enable powerline font symbols for vim-airline. https://github.com/vim-airline/vim-airline#integrating-with-powerline-fonts
let g:airline_powerline_fonts = 1
