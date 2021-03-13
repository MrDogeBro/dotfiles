" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Comments
    Plug 'tpope/vim-commentary'
    " Better Syntax Support
    " Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Themes
    Plug 'joshdick/onedark.vim'
    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Status Line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Ranger
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    " Rainbow Parentheses
    Plug 'junegunn/rainbow_parentheses.vim'
    " Start screen
    Plug 'mhinz/vim-startify'
    " Git Integration
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    " Sneak
    Plug 'justinmk/vim-sneak'
    " Which Key
    Plug 'liuchengxu/vim-which-key'
    " Floaterm
    Plug 'voldikss/vim-floaterm'
    " Buffer closing
    Plug 'moll/vim-bbye'
    " Snippets
    Plug 'honza/vim-snippets'
    " Better Whitespace
    Plug 'ntpeters/vim-better-whitespace'
    " Swap windows
    Plug 'wesQ3/vim-windowswap'
    " TS syntax highlights
    Plug 'HerringtonDarkholme/yats.vim'
    " JSX/TSX syntax highlights
    Plug 'maxmellon/vim-jsx-pretty'
    " Discord Rich Presence
    Plug 'MrDogeBro/vimsence'
    " Markdown preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
    " Tabnine
    " Plug 'zxqfl/tabnine-vim'
    " Async LSP
    " Plug 'prabirshrestha/vim-lsp'
    " PlatformIO integration
    Plug 'coddingtonbear/neomake-platformio'

    call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
