call plug#begin('~/.vim/plugged')
        Plug 'farmergreg/vim-lastplace'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'jiangmiao/auto-pairs'
        Plug 'scrooloose/nerdtree'
        Plug 'hashivim/vim-terraform'
        Plug 'Chiel92/vim-autoformat'
        Plug 'sheerun/vim-polyglot'
        Plug 'ycm-core/YouCompleteMe'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-sensible'
        Plug 'tpope/vim-surround'
        Plug 'tomasr/molokai'
"       Plug 'ap/vim-css-color'
        Plug 'flazz/vim-colorschemes'
        Plug 'terryma/vim-multiple-cursors'
        Plug 'markcornick/vim-vagrant'
        Plug 'gabrielelana/vim-markdown'
        Plug 'andrewstuart/vim-kubernetes'
        Plug 'ingydotnet/yaml-vim'
        Plug 'vimwiki/vimwiki'
        Plug 'junegunn/goyo.vim'
        Plug 'mhinz/vim-startify'
        Plug 'hzchirs/vim-material'

" Initialize plugin system
call plug#end()

" let g:molokai_original = 1

syntax on

colorscheme molokai_dark
set pastetoggle=<F3>
"       set relativenumber
