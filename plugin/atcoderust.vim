if exists('g:loaded_session')
  finish
endif
let g:loaded_session = 1

command! -nargs=? RID call atcoderust#AtRustInputDefinition(<f-args>)
command! -nargs=? RITD call atcoderust#AtRustIreratorToolDefinition(<f-args>)
command! -nargs=0 RITD2 call atcoderust#AtRustIreratorToolDefinition2()
command! -nargs=? RIO call atcoderust#CreatDefCodeOne(<f-args>)
command! -nargs=? RIL call atcoderust#CreatDefCodeLoop(<f-args>)
command! -nargs=0 RPerm call atcoderust#Permutation()
command! -nargs=0 RHash call atcoderust#AtRustHashDefinition()
command! -nargs=0 RHash2 call atcoderust#AtRustHashDefinition2()
command! -nargs=0 RBSearch call atcoderust#AtRustBinarySearch()

