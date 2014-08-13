set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" YouCompleteMe Plugin
Plugin 'Valloric/YouCompleteMe'
" UltiSnips.
 Plugin 'SirVer/ultisnips'
" Snippets for UltiSnips
 Plugin 'honza/vim-snippets'
" TagBar
Plugin 'majutsushi/tagbar'
" NerdTree
Plugin 'scrooloose/nerdtree.git'
" DelimitMate
Plugin 'Raimondi/delimitMate'
" MiniBufExplorer
Plugin 'fholgado/minibufexpl.vim'
" Syntastic
Plugin 'scrooloose/syntastic'
" Session Support
Plugin 'xolox/vim-session'
"vim misc
Plugin 'xolox/vim-misc'
"Todo List
Plugin 'vim-scripts/TaskList.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" Setting global YCM config
let g:ycm_global_ycm_extra_conf = '/home/jack/.vim/ycm_cfg.py'
" Showing line numbers
set nu
" Remap for TagBar
nmap <F8> :TagbarToggle<CR>
" Remap for NerdTree
nmap <silent> <F9> :NERDTreeToggle<CR>
" Colorscheme
colorscheme twilight256
" disable YouCompleteMe as syntaxchecker in favor of Syntastic
let g:ycm_register_as_syntastic_checker = 0
"Syntastic enabled
" On by default, turn it off for html
 let g:syntastic_mode_map = { 'mode': 'active',
			 \ 'active_filetypes': [],
 			 \ 'passive_filetypes': ['html'] }
" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!' 
" Autosessions
let g:session_autosave="yes"
"Compat script for Ulitsnips and YouCompleteMe
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
"let g:UltiSnipsExpandTrigger="<c-j>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"Setting wrapping around for git commit messages at 72 c/line and spelling
autocmd Filetype gitcommit setlocal spell textwidth=72
