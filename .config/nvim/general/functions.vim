function! PrevBufferTab()
  if &buftype != 'terminal'
    bprev
    if &buftype == 'terminal'
      call PrevBufferTabLoop()
    endif
  endif
endfunction

function! PrevBufferTabLoop()
  if &buftype == 'terminal'
    bprev
    call PrevBufferTabLoop()
  endif
endfunction

function! NextBufferTab()
  if &buftype != 'terminal'
    bnext
    if &buftype == 'terminal'
      call NextBufferTabLoop()
    endif
  endif
endfunction

function! NextBufferTabLoop()
  if &buftype == 'terminal'
    bnext
    call NextBufferTabLoop()
  endif
endfunction

function! ToggleRelativeLineNumbers()
  if &relativenumber == 1
    execute('set norelativenumber')
  else
    execute('set relativenumber')
  endif
endfunction
