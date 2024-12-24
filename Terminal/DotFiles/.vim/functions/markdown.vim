"----------------
" Name          : functions/markdown.vim
" Description   : Utility functions for working with Markdown in Vim.
" Author        : E Fournier
" Dependencies  : vim
"----------------

"" Insert a header based on the file name

function! MarkdownHeaderFromFileName()
  " Get the current file name without the directory path and extension
  let l:filename = expand('%:t:r')

  " Replace underscores with ' | ' and plus signs with ', '
  let l:formatted = substitute(substitute(l:filename, '_', ' | ', 'g'), '+', ', ', 'g')
  
  " Add spaces before each uppercase letter (split PascalCase)
  let l:formatted = substitute(l:formatted, '\(\l\)\(\u\)', '\1 \2', 'g')

  " Prepend '# ' to make it a Markdown header
  let l:formatted = '# ' . l:formatted

  " Insert the formatted header at the top of the file
  call append(0, l:formatted)
  call append(1, '')
endfunction

""" Mapping

nnoremap <Leader>mdh :call MarkdownHeaderFromFileName()<CR>

"" Convert The Selected Markdown To A Slack-Friendly syntax

""" Function

function! ConvertMarkdownForSlack()

  """"" Convert italics text (*italics*) to Slack's italics (_italics_)

  silent! s/\*\([^*]\+\)\*/_\1_/g

  """"" Convert bold text (**bold**) to Slack's bold (*bold*)

  silent! s/\*\*\(.*\)\*\*/*\1*/g
  
  """"" Convert interim instance of (_* & *_) to bold (**)

  silent! s/_\*\|\*_/*/g

  """"" Convert headings to just bold

  silent! s/^#\+\s\+\(.*\)$/*\1*/g

  """"" Remove language specifiers from code blocks

  silent! s/```[a-zA-Z0-9_-]\+/```/g
  
  """"" Double every level of indentation

  silent! s/^\( \+\)/\1\1/g

  """"" Remove highlighting

  noh

endfunction

""" Mapping

noremap <Leader>mds :call ConvertMarkdownForSlack()<CR>

"" Update Mardown Styling to 2024 Convention

""" Function

function! UpdateMarkdownStyle()

  """" Headers | Spacing

  silent! g/^#.*\n\([^\n#]\|#[^\n]\)/normal o

  """" Checkboxes | In Progress

  silent! %s/\[\~\]/\[\-\]/g

  """" Lists | Dashes

  silent! %s/\n\* /\r- /g

  """" Emphasis | Astrisks

  for i in range(5)
    silent! %s/\v(\s|[\r\n]|[*'"\(\{\[])_/\=submatch(1).'*'.submatch(2)/g
    silent! %s/\v_(\s|[\r\n]|[*'",.:;?!\)\}\]])/\=submatch(2).'*'.submatch(1)/g
  endfor

endfunction

""" Mapping

noremap <Leader>mdu :call UpdateMarkdownStyle()<CR>

