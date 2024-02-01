"----------------
" Name          : lg_open.vim
" Description   : Called from bash lg_open top open configured `lg` buffers in Vim
" Author        : E Fournier
" Dependencies  : lg_open
" Example Usage : source $ZSCRIPTS/lg_open.vim
"----------------

function! Main()
  " Writes the current year to a variable
  let $this_year = strftime("%Y", localtime())

  " Writes last year to a variable
  let $last_year = $this_year - 1

  " Appends file extensions to calculated years
  let $this_year_file = $this_year . '.md'
  let $last_year_file = $last_year . '.md'

  " Opens specific files in tabs in the specified order
  tabnew $this_year_file
  tabnew $last_year_file
  tabnew Xy.md
  tabnew _Next.md
  tabnew _Search.md

  " We maintain a tab with all directory files in splits
  " This is to ensure auto-complete queries all tabs
  " This is necessary, since all files are encrypted

  " Switch to the 1st tab
  " This is the tab with all files in splits
  tabn 1
  " Make this tab the last one
  tabm
  " Now push this tab to be the 2nd-to-last one
  tabm -1
  " Switch back to the 1st tab
  tabn 1
  " Create a new tab, split between 2 specified files
  tabnew Lg.md
  vsplit Do.md
  " Move the tab we just created to be the 1st one
  tabm 0
endfunction

call Main()

