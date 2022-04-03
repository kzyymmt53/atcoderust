
let s:def_type = "i64"
let s:def_version = "0.3.6"

function! s:helpDef()
    echo "Usage:"
    echo "\tRID <version>"
    echo "Default:"
    echo "\tversion: " . s:def_version
    echo "Example:"
    echo "\tRID 0.3.6"
    return 
endfunction

function! s:helpOne()
    echo "Usage:"    
    echo "\tRIO <type>"
    echo "Default:"  
    echo "\ttype: " . s:def_type  
    echo "Example:"  
    echo "\tRIO String"  
    return           
endfunction    

function! s:helpLoop() 
    echo "Usage:"     
    echo "\tRIL <type>"
    echo "Default:"   
    echo "\ttype:" . s:def_type
    echo "Example:"   
    echo "\tRIL String"   
    return            
endfunction  

function! atcoderust#AtRustInputDefinition(...) abort 

    let l_version = exists("a:1") ? a:1 : s:def_version

    if l_version == "help"
        call s:helpDef()
        return 
    endif

    let def = 'proconio = ' . '"' . l_version . '"'
    call append(line("$"), def )

endfunction

function! atcoderust#CreatDefCodeOne(...) abort
    
    let type = exists("a:1") ? a:1 : s:def_type
  
    if type == "help"
        call s:helpOne()
        return
    endif

    execute ":normal 1G"
    execute ":normal 100dd"
    execute ":normal a" . "use proconio::input;\n\n"
    execute ":normal a" . "fn main() {\n\n"
    execute ":normal a" . "    input! { \n"
    execute ":normal a" . "        a: " . type . ",\n"
    execute ":normal a" . "    }\n\n"
    execute ":normal a" . "}\n"

endfunction

function! atcoderust#CreatDefCodeLoop(...) abort

    let type = exists("a:1") ? a:1 : s:def_type

    if type == "help"
        call s:helpLoop()
        return                                                                                                                                 
    endif

    execute ":normal 1G"
    execute ":normal 100dd"
    execute ":normal a" . "use proconio::input;\n\n"
    execute ":normal a" . "fn main() {\n\n"
    execute ":normal a" . "    input! { \n"
    execute ":normal a" . "        n: usize,\n"
    execute ":normal a" . "    }\n\n"
    execute ":normal a" . "    for _ in 0..n {\n"
    execute ":normal a" . "        input! {\n"
    execute ":normal a" . "            a: " . type . ",\n"
    execute ":normal a" . "        }\n"
    execute ":normal a" . "    }\n\n"
    execute ":normal a" . "}\n"
        
endfunction

function! atcoderust#Permutation() abort

    execute ":normal G"
    execute ":normal O" . "\n"
    execute ":normal a" . "\n"
    execute ":normal O" . "pub trait LexicalPermutation { \n"
    execute ":normal a" . "    fn next_permutation(&mut self) -> bool; \n"
    execute ":normal a" . "    fn prev_permutation(&mut self) -> bool; \n"
    execute ":normal a" . "}\n\n"
    execute ":normal a" . "impl<T> LexicalPermutation for [T] where T: Ord {\n"
    execute ":normal a" . "    fn next_permutation(&mut self) -> bool {\n"
    execute ":normal a" . "        if self.len() < 2 { return false; }\n"
    execute ":normal a" . "        let mut i = self.len() - 1;\n\n"
    execute ":normal a" . "        while i > 0 && self[i-1] >= self[i] {\n"
    execute ":normal a" . "            i -= 1;\n"
    execute ":normal a" . "        }\n\n"
    execute ":normal a" . "        if i == 0 {\n"
    execute ":normal a" . "            return false;\n"
    execute ":normal a" . "        }\n\n"
    execute ":normal a" . "        let mut j = self.len() - 1;\n\n"
    execute ":normal a" . "        while j >= i && self[j] <= self[i-1]  {\n"
    execute ":normal a" . "            j -= 1;\n"
    execute ":normal a" . "        }\n\n"
    execute ":normal a" . "        self.swap(j, i-1); \n"
    execute ":normal a" . "        self[i..].reverse();  \n\n"
    execute ":normal a" . "        true \n\n"
    execute ":normal a" . "    }\n\n"
    execute ":normal a" . "    fn prev_permutation(&mut self) -> bool {\n"
    execute ":normal a" . "        if self.len() < 2 { return false; }\n"
    execute ":normal a" . "        let mut i = self.len() - 1;\n"
    execute ":normal a" . "        while i > 0 && self[i-1] <= self[i] {\n"
    execute ":normal a" . "            i -= 1;\n"
    execute ":normal a" . "        }\n\n"
    execute ":normal a" . "        if i == 0 { \n"
    execute ":normal a" . "           return false;\n"
    execute ":normal a" . "        }\n\n"
    execute ":normal a" . "        self[i..].reverse();\n\n"
    execute ":normal a" . "        let mut j = self.len() - 1;\n"
    execute ":normal a" . "        while j >= i && self[j-1] < self[i-1]  {\n"
    execute ":normal a" . "            j -= 1;\n"
    execute ":normal a" . "        }\n\n"
    execute ":normal a" . "        self.swap(i-1, j);\n\n"
    execute ":normal a" . "        true\n\n"
    execute ":normal a" . "    }\n\n"
    execute ":normal a" . "}\n\n"
 
endfunction
    


     
