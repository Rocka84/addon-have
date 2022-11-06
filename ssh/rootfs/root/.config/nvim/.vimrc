let $spm_project_set = SpmSetProject("neovimrc", "")
if $spm_project_set == 0
    augroup reload_vimrc
        autocmd!
        autocmd BufWritePost *.vimrc source %
        autocmd BufWritePost *.vim source %
    augroup END
endif
" if $spm_project_set < 2
"     let b:spm_dir = expand("%:h")
" endif
