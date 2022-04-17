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
command! -nargs=0 RQD call atcoderust#AtRustQueueDefinition()
command! -nargs=0 RQD2 call atcoderust#AtRustQueueDefinition2()
command! -nargs=0 RMM call atcoderust#AtRustMulMatrix()
command! -nargs=0 RPM call atcoderust#AtRustPowerMatrix()

