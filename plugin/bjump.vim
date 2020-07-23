if exists("g:bjump_loaded") || !exists("?getjumplist")
  finish
endif
let g:bjump_loaded = 1

nnoremap <silent> <script> <Plug>(bjump-previous-buffer) :call bjump#previous_buffer()<CR>
nnoremap <silent> <script> <Plug>(bjump-next-buffer) :call bjump#next_buffer()<CR>

if !exists("g:bjump_no_mappings") || ! g:bjump_no_mappings
  nmap <silent> <leader>o <Plug>(bjump-previous-buffer)
  nmap <silent> <leader>i <Plug>(bjump-next-buffer)
endif
