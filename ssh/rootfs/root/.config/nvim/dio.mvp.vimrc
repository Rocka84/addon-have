if SpmSetProject("MVP", "") == 0

    " plugin - vim-php-cs-fixer
    let g:php_cs_fixer_path = $DIO_MVP_ROOT . "vendor/bin/php-cs-fixer"
    let g:php_cs_fixer_config_file = $DIO_MVP_ROOT . ".php_cs.dist"

    " plugin - vim-phpqa - integrates phpmd
    let g:phpqa_messdetector_cmd = $DIO_MVP_ROOT . "vendor/bin/phpmd"
    let g:phpqa_messdetector_ruleset = $DIO_MVP_ROOT . "config-dev/phpmd.xml.dist"

    if !exists("*PhpGetsetProcessFuncname")
        function PhpGetsetProcessFuncname(funcname)
            let l:funcname = split(tolower(a:funcname), "_")
            let l:i = 0

            while l:i < len(l:funcname)
                let l:funcname[l:i] = toupper(l:funcname[l:i][0]) . strpart(l:funcname[l:i], 1)
                let l:i += 1
            endwhile

            return join(l:funcname, "")
        endfunction
    endif

    " nmap <leader>dse :execute "vertical diffsplit /media/sshfs/extern/" . substitute(expand('%'),"\/var\/www\/maklerinfo.local\/","","")<cr> 
    " nmap <leader>dsi :execute "vertical diffsplit /media/sshfs/intern/" . substitute(expand('%'),"\/var\/www\/maklerinfo.local\/","","")<cr> 

    nnoremap <leader><leader>ul "wyiwf_x~"eyiwve"wp:call PhpRenameLocalVariable()<CR><C-R>e
    nnoremap <leader><leader>uc "wyiwf_x~"eyiwve"wp:call PhpRenameClassVariable()<CR><C-R>e

    nnoremap <leader><leader>cl "wyiw~"eyiwve"wp:call PhpRenameLocalVariable()<CR><C-R>e
    nnoremap <leader><leader>cc "wyiw~"eyiwve"wp:call PhpRenameClassVariable()<CR><C-R>e
    nnoremap <leader>ma mb/^=====<CR>V/^>>>>>><CR>d'bdd
    nnoremap <leader>mb V/^=====<CR>d/^>>>>><CR>dd

    "let g:deoplete#sources#padawan#server_command=$HOME . '.composer/vendor/mkusher/padawan/bin/padawan-server'
    "let g:deoplete#sources#padawan#add_parentheses=1

    let g:startify_custom_header = [system('echo -n "Branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null)"')]
    set tags+=.php.tags
    set tags+=.php.yii.tags

    let g:airline#parts#ffenc#skip_expected_string='latin1[unix]'

    let g:vdebug_options.path_maps = {
        \ '/var/kunden/webs/blaudirekt': '/home/fd/projects/maklerinfo'
    \ }
endif
