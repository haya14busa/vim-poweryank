"=============================================================================
" FILE: autoload/poweryank.vim
" AUTHOR: haya14busa
" License: MIT license
"=============================================================================
scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

let s:Clipboard = vital#poweryank#import('Clipboard')

function! poweryank#osc52(text) abort
  return s:Clipboard.copy_osc52(a:text)
endfunction

function! poweryank#cmd_osc52(...) abort
  let text = get(a:, 1, '')
  if text !=# ''
    return poweryank#osc52(text)
  endif
  return s:osc52_selected()
endfunction

function! poweryank#opfunc_osc52(type, ...) abort
  let is_visual = get(a:, 0, 0)
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@
  if is_visual  " Invoked from Visual mode, use gv command.
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif
  call poweryank#osc52(@@)
  let &selection = sel_save
  let @@ = reg_save
endfunction

function! s:osc52_selected() abort
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@
  silent exe "normal! gvy"
  call s:Clipboard.copy_osc52(@@)
  let &selection = sel_save
  let @@ = reg_save
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
