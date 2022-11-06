" SimpleProjectManager

function! SpmSetProject(name, ...)
    if s:spm_name == a:name
        return 1
    endif
    if s:spm_name != ""
        let b:spm_name = a:name
        let b:spm_dirty = 1
        return 2
    endif

    let s:spm_name = a:name
    if a:0 > 0
        let s:spm_icon = a:1
    endif

    if exists("s:spm_airline")
        normal :AirlineRefresh<cr>
    endif
    return 0
endfunction

function! SpmStatus()
    if exists("b:spm_dirty")
        return s:SpmStatusDirty()
    endif

    if s:spm_name == ""
        return ""
    endif

    return get(s:, "spm_icon", g:spm_icon)." ".s:spm_name
endfunction

function! s:SpmStatusDirty()
    if exists("b:spm_name")
        return g:spm_dirty_icon
                    \ ." WRONG PROJECT "
                    \ .b:spm_name
                    \ ." ".g:spm_dirty_icon
    endif

    return g:spm_dirty_icon
                \ ." NOT IN PROJECT"
                \ ." ".g:spm_dirty_icon
endfunction

function! s:SpmInit()
    if !exists("s:spm_name")
        let s:spm_name = ""
    endif
    if !exists("g:spm_icon")
        let g:spm_icon = ""
    endif
    if !exists("g:spm_dirty_icon")
        let g:spm_dirty_icon = ""
    endif

    set statusline+=%=%{SpmStatus()}%*

    augroup SimpleProjectManager
        au!
        au BufEnter,BufReadPost * :call s:SpmCheckForConfig()
    augroup END

    call s:SpmCheckForConfig()
endfunction

function! s:SpmInitAirline()
    let s:spm_airline = 1
    call airline#parts#define_function('spmstatus', 'SpmStatus')
    call airline#parts#define_function('spmffenc', 'SpmAirlineFfenc')
    let g:airline_section_y = airline#section#create(['spmstatus', 'spmffenc'])
endfunction

function! SpmAirlineFfenc()
    return s:SpmAirlineSeperateIfSet(airline#parts#ffenc())
endfunction

function! s:SpmAirlineSeperateIfSet(content)
    if a:content == ""
        return ""
    endif
    return g:airline_symbols.space.g:airline_symbols.space
                \.g:airline_right_alt_sep.g:airline_symbols.space.a:content
endfunction

function! s:SpmCheckForConfig()
    let l:git_root = expand(system("echo -n $(cd ".expand("%:h")."; git rev-parse --show-toplevel 2>/dev/null)"))
    let l:project_vimrc = l:git_root."/.vimrc"

    if l:project_vimrc == expand("$HOME/.vimrc") || !filereadable(l:project_vimrc)
        if s:spm_name != ""
            let b:spm_dirty = 1
        endif
        return
    endif

    if exists("s:spm_root") && s:spm_root != l:git_root
        let b:spm_dirty = 1
    else
        let s:spm_root = l:git_root
    endif

    " echon 'sourcing '.l:project_vimrc
    execute "source ".l:project_vimrc
    execute "cd ".l:git_root

    " backward compat.
    if exists("g:simple_project_name")
        call SpmSetProject("LEGACY ".g:simple_project_name,"")
    endif
endfunction


augroup SimpleProject
    au!
    au VimEnter * :call s:SpmInit()
augroup END

augroup SimpleProjectAirline
    au!
    au User AirlineAfterInit :call s:SpmInitAirline()
augroup END
