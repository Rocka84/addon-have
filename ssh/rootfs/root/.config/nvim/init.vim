" ###########
"   Plugins
" ###########

so ~/.config/nvim/plugins.vimrc


" ##########
"   Config
" ##########


" directories
set undodir=~/.config/nvim/temp/undo
set backupdir=~/.config/nvim/temp/backup
let g:startify_session_dir = '~/.config/nvim/temp/session'

" +---------+
" | Visuals |
" +---------+

set nocompatible             " be iMproved
syntax on
filetype plugin indent on

set number                   " show line numbers
set tabstop=4                " a tab is four spaces
set shiftwidth=4             " number of spaces to use for autoindenting
set expandtab                " indent using spaces
set shiftround               " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent               " always set autoindenting on
set copyindent               " copy the previous indentation on autoindenting
set guifont=Monospace\ 11
set relativenumber
set nowrap                   " no line wrapping
set sidescroll=5             " scroll 5 chars when reaching window borders
set listchars+=precedes:<,extends:> " show markers if part(s) of a line is invisible
set shortmess+=I             " Disable startup message

set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set showtabline=2

if !has('gui_running')
    set t_Co=256
endif
set background=dark
colorscheme tender


set wildmode=longest,list,full
set wildmenu


" +-----------+
" | Searching |
" +-----------+

set ignorecase               " ignore case when searching
set smartcase                " ignore case if search pattern is all lowercase,
set incsearch

" +--------+
" | Splits |
" +--------+

set splitright
set splitbelow


" Set complete modes
" default .,w,b,u,t,i
set complete=.,w,b,u,t
set completeopt+=menu,menuone

" +------+
" | misc |
" +------+

" Enable mouse if supported
" if has('mouse')
"   set mouse=a
" endif


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif


" ############
"   Mappings
" ############


let mapleader="^"

imap jj <esc>

" nnoremap <PageUp> <PageUp>zz
" nnoremap <PageDown> <PageDown>zz
" nnoremap <C-b> <C-b>zz
" nnoremap <C-f> <C-f>zz

" Copy file path
nmap <silent> <leader>yp :let @+ = expand("%:p")<cr>
nmap <silent> <leader>yd :let @+ = expand("%:h")<cr>
nmap <silent> <leader>cd :cd <C-R>=expand("%:h")<cr><cr>:pwd<cr>

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" +-----+
" | git |
" +-----+

nmap <leader>gd :!git diff %<cr><cr>
nmap <leader>ga :!git add %<cr><cr>
nmap <leader>gc :Gcommit<cr>

" plugin - gitgutter
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gb <Plug>(GitGutterPrevHunk)
nmap <leader>gv <Plug>(GitGutterPreviewHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)



" +------------------------+
" | Buffers, Splits & Tabs |
" +------------------------+

" Split switching
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nmap <C-c> <C-W>c

" delete buffer
nmap <leader>bd <esc>:bd<cr>
" list buffers
nmap <leader>bl <esc>:ls<cr>

" show split in 'fullscreen'
nmap <leader># <C-w>\|<C-w>_zz
" rearrange splits
nmap <leader>' <C-w>=

" buffer navigation with F-keys
" F15 = Shift F3 = F12 +3
nmap <silent> <S-F3> :bprev<cr>
nmap <silent> <F15> :bprev<cr>
imap <silent> <S-F3> <esc>:bprev<cr>
imap <silent> <F15> <esc>:bprev<cr>

nmap <silent> <S-F4> :bnext<cr>
nmap <silent> <F16> :bnext<cr>
imap <silent> <S-F4> <esc>:bnext<cr>
imap <silent> <F16> <esc>:bnext<cr>

" tab navigation with F-keys
" F27 = Ctrl F3 = F12 + F12 +3
nmap <silent> <F26> :tabnew<cr>
imap <silent> <F26> <esc>:tabnew<cr>

nmap <silent> <F27> :tabprev<cr>
imap <silent> <F27> <esc>:tabprev<cr>

nmap <silent> <F28> :tabnext<cr>
imap <silent> <F28> <esc>:tabnext<cr>

" +---------+
" | Editing |
" +---------+

" Quick copy lines
vmap <leader>j yp
vmap <leader>k yP
nmap <leader>j yyp
nmap <leader>k yyP
imap <leader>j <esc>yypi
imap <leader>k <esc>yyPi

" Move lines
nmap <A-k> ddkP
nmap <A-j> ddp

" insert blank line
nnoremap <silent> oo o<esc>
nnoremap <silent> OO O<esc>

" Goto last edit
nmap <leader>q g;zz
nmap <leader>Q g,zz
imap <leader>q <esc>g;zzi
imap <leader>Q <esc>g,zzi

" vmap <C-C> "+y
" nmap <C-V> "+gP
" vmap <C-V> "+gP
" imap <C-V> <esc>"+gpi

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

nnoremap <silent> <C-C> :close<cr>
nnoremap <C-C><C-C> :q<cr>
nnoremap <silent> <C-C><C-C><C-C> :q!<cr>
nnoremap <C-B> :bd<cr>
nnoremap <silent> <C-B><C-B> :bd!<cr>


nnoremap <silent> <leader>T <esc>gg/feature\/<cr>wwy3egg0P:noh<cr>a<space>

" treat *.md as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


" +--------+
" | Coding |
" +--------+


" plugin - Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1

let g:syntastic_error_symbol = ""
let g:syntastic_style_error_symbol = "ﭹ"
let g:syntastic_warning_symbol = "כֿ"
let g:syntastic_style_warning_symbol = "כֿ"


" | php specific |
" + -------------+

" plugin - php-getter-setter
let g:phpgetset_setterTemplate =
    \ "\n" .
    \ "    /**\n" .
    \ "     * @return static\n" .
    \ "     */\n" .
    \ "    public function %funcname%($%varname%)\n" .
    \ "    {\n" .
    \ "        $this->%varname% = $%varname%;\n" .
    \ "        return $this;\n" .
    \ "    }"

let g:phpgetset_getterTemplate =
    \ "\n" .
    \ "    public function %funcname%()\n" .
    \ "    {\n" .
    \ "        return $this->%varname%;\n" .
    \ "    }"

autocmd FileType php setlocal commentstring=//\ %s

" plugin - pdv - create phpdoc-blocks
" let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates"
" nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>
" nnoremap <leader>p :call pdv#DocumentCurrentLine()<CR>

" plugin - vim-php-cs-fixer
let g:php_cs_fixer_enable_default_mapping = 0

" Write file before executing cs-fixer
if !exists("*CsFixer")
    function CsFixer()
        execute ":w"
        call PhpCsFixerFixFile()
    endfunction
endif

nnoremap <silent><leader>cs :call CsFixer()<CR>
nnoremap <silent><leader>dcs :call PhpCsFixerFixDirectory()<CR>
" autocmd BufWritePre *.php* :call PhpCsFixerFixFile()

" plugin - vim-phpqa - integrates phpmd
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_messdetector_autorun = 0
let g:phpqa_open_loc = 0

" Run phpmd and open the result list
" I didn't want the location list to open on every save of a messy file,
" (so I set g:phpqa_open_loc = 0) but needed something handy to manually
" run phpmd _and_ opening the result list
if !exists("*PhpMessDetection")
    function PhpMessDetection()
        execute ":w"
        execute ":Phpmd"
        execute ":lopen"
    endfunction
    command Md call PhpMessDetection()
    nmap <silent><leader>md :call PhpMessDetection()<cr>
    " nmap <silent><leader>md :Phpmd()<cr><cr>:lopen<cr>
endif

" stop highlighting results
" hide location list
nmap <silent> <esc><esc> :noh<cr>:lcl<cr>

let g:DisableAutoPHPFolding = 1
let g:DisablePHPFoldingIncludes = 1
let g:DisablePHPFoldingProperties = 1

" map <F5> <Esc>:EnableFastPHPFolds<Cr>
" map <F6> <Esc>:EnablePHPFolds<Cr>
" map <F7> <Esc>:DisablePHPFolds<Cr>

" plugin - vim-php-refactoring-toolbox
let g:vim_php_refactoring_auto_validate_visibility = 1

let g:phpcomplete_mappings={'jump_to_def': 'gs', 'jump_to_def_vsplit': 'g<S-s>', 'jump_to_def_split': '<C-W><C-]>'}

let g:deoplete#enable_at_startup = 1

nmap <leader>ra /array(<cr>mzf(%r]`zcf([<esc>


" | cpp specific |
" + -------------+

function! CppFolds()
  if indent(v:lnum) / &shiftwidth > 0
    return 1
  endif

  let thisline = getline(v:lnum)
  if thisline =~? '\v^\s*$'
    return '-1'
  endif

  if thisline =~ '^#if' || thisline =~ '^#end'
    return 1
  endif

  return 0
endfunction

autocmd FileType cpp setlocal foldmethod=expr
autocmd FileType cpp setlocal foldexpr=CppFolds()
autocmd FileType cpp setlocal foldminlines=2

autocmd FileType cpp setlocal commentstring=//\ %s


" +-------+
" | Files |
" +-------+

" save file
nmap <leader>w :w<cr>
imap <leader>w <esc>:w<cr>i

" echo current file path
nmap <leader><esc> :echo expand('%')<cr>

" plugin - CtrlP
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>1 :e#<cr>
nmap <leader>2 :CtrlPBuffer<cr>
" nmap <C-p> <Plug>CtrlP
" nmap <C-p> :CtrlP<cr>
nmap <leader>l :CtrlPMRUFiles<cr>

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
                \ --ignore .git
                \ --ignore .svn
                \ --ignore .hg
                \ --ignore .DS_Store
                \ --ignore node_modules
                \ --ignore vendor
                \ --ignore "**/*.pyc"
                \ -g ""'
else
    let g:ctrlp_user_command = {
                \ 'types': {
                    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
                    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                    \ 'fallback': 'find %s -type f'
                \ }
endif

let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/](\.git|\.hg|\.svn|bower_components|dist|node_modules|vendor|tmpl_c|cache|vergleichsrechnerverwaltung)$'
            \ }


" ########
"   misc
" ########

" dont open help on F1
noremap <silent> <f1> :echo<cr>

map <leader>t :TagbarToggle<cr>

" learn not to use the arrow keys!
function! ArrowKeysOff()
    map <left> <Nop>
    map <down> <Nop>
    map <up> <Nop>
    map <right> <Nop>
endfunction

function! ArrowKeys()
    nmap <left> h
    nmap <down> j
    nmap <up> k
    nmap <right> l

    vmap <left> h
    vmap <down> j
    vmap <up> k
    vmap <right> l
endfunction

command! ArrowKeys call ArrowKeys()
command! ArrowKeysOff call ArrowKeysOff()
call ArrowKeysOff()

" quickly edit this file
nmap <leader>rc :tabedit ~/.config/nvim/init.vim<cr>

" Use caps-lock as escape
augroup caps_escape
    autocmd!
    autocmd VimEnter * call system('setxkbmap -option caps:escape')
augroup END

function! ToggleRelativenumber()
    if &relativenumber == 1
        set norelativenumber
    else
        set relativenumber
    endif
endfunction
nmap <silent> <leader>n :call ToggleRelativenumber()<cr>

" Startify
let g:startify_change_to_vcs_root = 1
let g:startify_list_order = [
                \ [
                \  'Recently used here',
                \  '=================='
                \ ],
                \ 'dir',
                \ [
                \  'Recently used',
                \  '============='
                \ ],
                \ 'files',
                \ [
                \  'Bookmarks',
                \  '========='
                \ ],
                \ 'bookmarks',
                \ [
                \  'Sessions',
                \  '========'
                \ ],
                \ 'sessions',
                \ [
                \  'Misc. commands',
                \  '=============='
                \ ],
                \ 'commands'
            \ ]
let g:startify_commands = [['git status', ':Gstatus'], ['Update Plugins', ':PlugUpdate']]
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header = []

" ########
"   gui
" ########

" Switch to Fullscreen
augroup maximizewindow
    autocmd!
    autocmd VimEnter * call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)
augroup END

" Repair visual block mode
if has('gui_running')
    unmap! <C-v>
endif

if exists('g:nyaovim_version')
    let g:markdown_preview_auto=0
    nmap <silent> <C-x> :MiniBrowserClose<cr>
endif
let g:php_manual_online_search_shortcut = '<A-h>'

" check for changes outside of vim
au FocusGained,BufEnter * :silent!!

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : '',
      \ 'i'  : '',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : '',
      \ 'V'  : '',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ 'netrw'  : '',
      \ }
let g:airline#extensions#branch#format = 2
let g:airline#extensions#hunks#hunk_symbols = ['', '', '']
let g:webdevicons_enable_airline_statusline_fileformat_symbols  = 0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_section_z = "%v:%l/%L"
" let g:airline_section_z = "%{airline#util#wrap(airline#parts#ffenc(),0)} %3v :%4l/%L"
" let g:airline#extensions#default#layout = [
"       \ [ 'a', 'b', 'c' ],
"       \ [ 'x', 'y', 'z', 'error', 'warning' ]
"       \ ]
let g:airline_skip_empty_sections=1
let g:bufferline_echo=0

let g:airline#extensions#tagbar#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.crypt = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.ellipsis = '…'
let g:airline_symbols.modified = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = ""
let g:bufferline_modified = ' '

if executable('ag')
    let g:ackprg = 'ag --vimgrep --smart-case'
endif
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

let $local_rc = expand("$HOME")."/.vimrc.local"
if filereadable($local_rc)
    source $local_rc
endif

" typescript
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']


if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif
let g:vdebug_options.ide_key = 'xdebug'
let g:vdebug_options.break_on_open = 0



nnoremap <silent> _ :Ranger<cr>
