syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

colorscheme petrel

if $SSH_CONNECTION
	colorscheme petrel
endif



set exrc
set secure


set autoindent
set smartindent

"set number

set showmatch




" Plugin Auto Load
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'junegunn/vim-plug'

Plug 'reasonml-editor/vim-reason-plus'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" for neovim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" for vim 8 with python
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  " the path to python3 is obtained through executing `:echo exepath('python3')` in vim
  let g:python3_host_prog = "/absolute/path/to/python3"
endif

" nice to have
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:LanguageClient_serverCommands = {
    \ 'reason': ['/absolute/path/to/reason-language-server.exe'],
    \ }

" enable autocomplete
let g:deoplete#enable_at_startup = 1



