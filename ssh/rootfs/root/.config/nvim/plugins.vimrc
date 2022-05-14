" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" colorscheme
Plug 'jacoborus/tender'

" file explorer etc
Plug 'tpope/vim-vinegar'
" ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

Plug 'ctrlpvim/ctrlp.vim' ", { 'on':  [ 'CtrlP', 'CtrlPMRUFiles', 'CtrlPBuffer', 'CtrlPCurFile', 'CtrlPCurWD', 'CtrlPMRU', 'CtrlPLastMode', 'CtrlPRoot' ]  }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Argument text object (a)
" Plug 'vim-scripts/argtextobj.vim'
" Indentation text object (i)
Plug 'michaeljsmith/vim-indent-object'

" git stuff
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'

Plug 'tpope/vim-commentary'
" Make some more actions 'repeatable'
Plug 'tpope/vim-repeat'

" Syntax checking
Plug 'scrooloose/syntastic'

Plug 'tpope/vim-surround'

" php code folding
" Plug 'Rocka84/phpfolding.vim', { 'for': 'php', 'on': [ 'EnablePHPFolds', 'EnableFastPHPFolds', 'DisablePHPFolds' ] }

" php syntax file
Plug 'StanAngeloff/php.vim', { 'for': 'php' }

" php code completion - not working, plugin collision?
" Plug 'shawncplus/phpcomplete.vim'

" Mess Detector
Plug 'joonty/vim-phpqa', { 'for': 'php' }
" CS Fixer
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php', 'on': [ 'PhpCsFixerFixFile', 'PhpCsFixerFixDirectory' ]}

Plug 'Rocka84/vim-php-manual'


" Create getters/setters in php
Plug 'docteurklein/php-getter-setter.vim', { 'for': 'php' }

" Better indentation of html in php files
Plug 'captbaritone/better-indent-support-for-php-with-html', { 'for': 'php' }

" the name says it all...
Plug 'adoy/vim-php-refactoring-toolbox', { 'for': 'php' }

Plug 'mhinz/vim-startify'

Plug 'majutsushi/tagbar'

" Plug 'Shougo/denite.nvim'

Plug 'ntpeters/vim-better-whitespace'

Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
" Plug 'edkolev/tmuxline.vim'

Plug 'djoshea/vim-autoread'
Plug 'mileszs/ack.vim'

Plug 'mbbill/undotree'

" process line and column jump specifications in file paths
Plug 'kopischke/vim-fetch'

" Navigate between tmux and vim window
Plug 'christoomey/vim-tmux-navigator'

Plug 'vim-vdebug/vdebug'

Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

if exists('g:nyaovim_version')
    Plug 'rhysd/nyaovim-markdown-preview'
    Plug 'rhysd/nyaovim-mini-browser'
endif

Plug 'ryanoasis/vim-devicons'

call plug#end()

