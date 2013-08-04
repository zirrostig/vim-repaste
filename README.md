RePaste
=======
Replaces text specified by a motion (or visual) with current clipboard.

Usage
=====
<leader>r followed by a motion will delete text and then put text from the 
"1" register. The deleted text is default not preserved, but can configured to
be stored into another register.

Configuration
=============
g:RePaste_DeleteRegister -> set to register that you want to store deleted
                            text to.

eg.

let g:RePaste_DeleteRegister = "r"
