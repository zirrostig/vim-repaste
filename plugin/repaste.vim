"Author: Zachary Stigall
"Version: 0.1
"Last Change: 4 Aug 2013
"License: VIM License
"About: RePaste is a small plugin to add an additional command that lets you
"easily replace text with whatever is in your default register
"
fun ReplaceWithRegister(type, ...)
    "Set delete register, throw out if not defined
    if exists("g:RePaste_DeleteRegister")
       \ && strlen("g:RePaste_DeleteRegister") == 1 "Safety check
        let a:reg = g:RePaste_DeleteRegister
    else
        let a:reg = "_"
    endif

    if a:0 "Visual
        let l:select = "`<" . a:type . "`>"
    elseif a:type == 'line'
        let l:select = "'[V']"
    elseif a:type == 'block'
        let l:select = "`[\<C-V>`]"
    else
        let l:select = "`[v`]"
    endif
    sil exe "norm! " . l:select . '"' . a:reg . 'dP'
endfun

nmap <silent> <leader>r :set opfunc=ReplaceWithRegister<CR>g@
vmap <silent> <leader>r :<C-U>call ReplaceWithRegister(visualmode(), 1)<CR>

