"=============================================================================
" FILE: plugin/poweryank.vim
" AUTHOR: haya14busa
" License: MIT license
"=============================================================================
scriptencoding utf-8
if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_poweryank
endif
if exists('g:loaded_poweryank')
  finish
endif
let g:loaded_poweryank = 1
let s:save_cpo = &cpo
set cpo&vim

command! -range -nargs=? PowerYankOSC52 call poweryank#cmd_osc52(<q-args>)

nnoremap <silent> <Plug>(operator-poweryank-osc52) :set opfunc=poweryank#opfunc_osc52<CR>g@
xnoremap <silent> <Plug>(operator-poweryank-osc52) :<C-u>call poweryank#opfunc_osc52(visualmode(), 1)<CR>
onoremap <silent> <Plug>(operator-poweryank-osc52) g@

let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
