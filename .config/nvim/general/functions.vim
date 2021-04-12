function! PrevBufferTab()
  if &buftype != 'terminal'
    bprev
    if &buftype == 'terminal'
      bprev
    endif
  endif
endfunction

function! NextBufferTab()
  if &buftype != 'terminal'
    bnext
    if &buftype == 'terminal'
      bnext
    endif
  endif
endfunction
