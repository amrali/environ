function! myspacevim#before() abort
    let profile = SpaceVim#mapping#search#getprofile('rg')
    let default_opt = profile.default_opts + ['--no-ignore-vcs']
    call SpaceVim#mapping#search#profile({'rg' : {'default_opts' : default_opt}})
    call SpaceVim#plugins#tasks#reg_provider(funcref('s:cargo_task'))

    " Gruvbox color theme config
    let g:gruvbox_contrast_dark = "hard"
    let g:gruvbox_transparent_bg = 1
    let g:gruvbox_improved_strings = 0
    let g:gruvbox_improved_warnings = 1

    " Syntastic Config
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    " (Optional)Remove Info(Preview) window
    set completeopt-=preview

    " (Optional)Hide Info(Preview) window after completions
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif

    " (Optional) Enable terraform plan to be include in filter
    let g:syntastic_terraform_tffilter_plan = 0

    " (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
    let g:terraform_completion_keys = 1

    " (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
    let g:terraform_registry_module_completion = 0

    autocmd FileType terraform autocmd BufWritePre <buffer> :TerraformFmt
endfunction

function! s:cargo_task() abort
    if filereadable('Cargo.toml')
        let commands = ['build', 'run', 'test']
        let conf = {}
        for cmd in commands
            call extend(conf, {
                        \ cmd : {
                        \ 'command': 'cargo',
                        \ 'args' : [cmd],
                        \ 'isDetected' : 1,
                        \ 'detectedName' : 'cargo:'
                        \ }
                        \ })
        endfor
        return conf
    else
        return {}
    endif
endfunction

function! myspacevim#after() abort
  " destructor
endfunction
