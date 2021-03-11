" Dynamically get and set paths if exists
let python_path = substitute(system("which python3"), '\n', '', 'g')
if v:shell_error == 0
  let g:python3_host_prog = expand(python_path)
endif

let node_path = substitute(system("which node"), '\n', '', 'g')
if v:shell_error == 0
  let g:node_host_prog = expand(node_path)
endif
