"----------------
" Name          : lg_open.vim
" Description   : Opens `lg` buffers per custom configuration
" Author        : E Fournier
" Dependencies  : lg_open
" Example Usage : source $ZSCRIPTS/lg/lg_open.vim
"----------------

function! SwitchToTabIndex(index)
  exe 'tabn ' . a:index
endfunction

function! MoveCurrentTabToIndex(index)
  exe 'tabm ' . a:index
endfunction

function! MoveCurrentTabToLast()
  exe 'tabm'
endfunction

function! CreateNewTabWithVerticalSplits(...)
  exe 'tabnew ' . a:1

  let l:arg_index = 2
  while l:arg_index <= a:0
    exe 'vsplit ' . a:{l:arg_index}
    let l:arg_index += 1
  endwhile
endfunction

function! OpenYearFiles()
  let l:this_year = strftime("%Y", localtime())

  call OpenThisYearInTab(l:this_year)

  call OpenLastYearInTab(l:this_year)
endfunction

function! OpenThisYearInTab(this_year)
  let l:this_year_file = a:this_year . '.md'

  exe 'tabnew ' . l:this_year_file
endfunction

function! OpenLastYearInTab(this_year)
  let l:last_year = a:this_year - 1
  let l:last_year_file = l:last_year . '.md'

  exe 'tabnew ' . l:last_year_file
endfunction

function! OpenFilesInTabs(...)
  let l:arg_index = 1
  while l:arg_index <= a:0
    exe 'tabnew ' . a:{l:arg_index}
    let l:arg_index += 1
  endwhile
endfunction

function! MoveFirstTabToIndex(index)
  call SwitchToTabIndex(1)

  call MoveCurrentTabToLast()

  call MoveCurrentTabToIndex(a:index)
endfunction

function! OpenBufferConfiguration()
  call CreateNewTabWithVerticalSplits('Lg.md', 'Do.md')

  call OpenYearFiles()

  call OpenFilesInTabs('Xy.md', '_Next.md', '_Search.md')
  
  call MoveFirstTabToIndex(-2)

  call SwitchToTabIndex(1)
endfunction

call OpenBufferConfiguration()

