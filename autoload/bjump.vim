

function! s:jump_to_first_different_buffer(jumplist, direction) abort
  let buf_id = bufnr()
  let jump_count = 0
  let jumps_to_apply = 0
  for jmp in a:jumplist
    let jump_count += 1
    if jmp.bufnr != buf_id
      let jumps_to_apply = jump_count
      break
    endif
  endfor

  if jumps_to_apply > 0
    execute "normal" jumps_to_apply . a:direction
  endif
endfunction

function! bjump#previous_buffer() abort

  let [jumplist, jpos] = getjumplist()
  let jumplist = reverse(jumplist[0:jpos])

  call <SID>jump_to_first_different_buffer(jumplist,"\<C-O>")

endfunction


function! bjump#next_buffer() abort

  let [jumplist, jpos] = getjumplist()
  let jumplist = jumplist[jpos+1:]

  call <SID>jump_to_first_different_buffer(jumplist,"\<C-I>")

endfunction
