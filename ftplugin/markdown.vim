function! PostHeader()
exe "normal aheader\<Tab>"
endfunc

function! HasHeader()
  let date = strftime("%F")
  let l3=getline(3)
  if l3[:8] is# '  "date":'
    if l3[11:20] is# date
      return
    endif
    3s/\d\{4}-\d\{2}-\d\{2}/\=date/
  else
    1call PostHeader()
  endif
endfunction

"augroup markdownHeader
"  "autocmd!
"  autocmd BufWinEnter * call HasHeader()
"augroup END
autocmd Filetype markdown call HasHeader()

setlocal textwidth=100
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal smarttab

map <F3> :call PostHeader()<CR>

inoremap <Leader>! ![]({{urls.media}})<Esc>i
inoremap <Leader>[ []({{urls.media}})<Esc>i
inoremap <Leader>d <details><summary></summary><img src="{{urls.media}}/"></details><Esc>T"<bs>i
inoremap <Leader>$ $$<Esc>p`]<Esc>a$$
inoremap $ $$

