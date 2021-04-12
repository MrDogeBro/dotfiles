" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use shift + ↑↓←→ to resize windows
nnoremap <silent> <S-Up>      :resize -2<CR>
nnoremap <silent> <S-Down>    :resize +2<CR>
nnoremap <silent> <S-Right>   :vertical resize -2<CR>
nnoremap <silent> <S-Left>    :vertical resize +2<CR>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :call NextBufferTab()<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :call PrevBufferTab()<CR>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Execute commands
nnoremap <C-S-A-a> :make upload<CR><CR>

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" Better terminal modes
tnoremap <C-s> <C-\><C-d>
