if exists('g:loaded_session')
  finish
endif
let g:loaded_session = 1

command! -nargs=? RID call atcoderust#AtRustInputDefinition(<f-args>)
command! -nargs=? RIO call atcoderust#CreatDefCodeOne(<f-args>)
command! -nargs=? RIL call atcoderust#CreatDefCodeLoop(<f-args>)
command! -nargs=0 RPerm call atcoderust#Permutation()

