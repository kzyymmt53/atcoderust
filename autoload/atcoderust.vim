
let s:def_type = "i64"
let s:def_version = "0.3.6"
let s:def_version_iter = "0.10.2" 
let s:def_dim_matrix = "2" 

function! s:helpDef()
    echo "Usage:"
    echo "\tRID <version>"
    echo "Default:"
    echo "\tversion: " . s:def_version
    echo "Example:"
    echo "\tRID 0.3.6"
    return 
endfunction

function! s:helpIterDef()
    echo "Usage:"
    echo "\tRITD <version>"
    echo "Default:"
    echo "\tversion: " . s:def_version_iter
    echo "Example:"
    echo "\tRIID 0.10.2"
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

function! atcoderust#AtRustIreratorToolDefinition(...) abort

    let l_version = exists("a:1") ? a:1 : s:def_version_iter

    if l_version == "help"
        call s:helpIterDef()
        return
    endif

    let def = 'itertools = ' . '"' . l_version . '"'
    call append(line("$"), def )

endfunction

function! atcoderust#AtCombMod() abort
    execute ":normal G"                                                                                                                        
    execute ":normal O" . "\n"  
    execute ":normal a" . "fn combi(bunshi: i64, bunbo: i64, m: i64) -> i64 {\n"
    execute ":normal a" . "    return bunshi * modpow(bunbo % m, m - 2, m) % m;\n"
    execute ":normal a" . "}\n\n"
    execute ":normal a" . "fn modpow(mut bunbo: i64, p: i64, m: i64) -> i64 {\n"
    execute ":normal a" . "    let mut ans = 1;\n\n"
    execute ":normal a" . "    for i in 0..60 {\n"
    execute ":normal a" . "        if p & (1 << i) != 0 {\n"
    execute ":normal a" . "            ans *= bunbo;\n"
    execute ":normal a" . "            ans %= m;\n"
    execute ":normal a" . "        }\n"
    execute ":normal a" . "        bunbo *= bunbo;\n"
    execute ":normal a" . "        bunbo %= m;\n"
    execute ":normal a" . "    }\n\n"
    execute ":normal a" . "    return ans;\n\n"
    execute ":normal a" . "}\n\n"

endfunction

function! atcoderust#AtRustLcm() abort
    execute ":normal G"               
    execute ":normal O" . "\n"  
    execute ":normal a" . "fn lcm(a: i64, b: i64) -> i64 {\n"
    execute ":normal a" . "    return a / gcd(a, b) * b;\n"
    execute ":normal a" . "}\n\n"
    execute ":normal a" . "fn gcd(a: i64, b: i64) -> i64 {\n"
    execute ":normal a" . "    if b == 0 {\n"
    execute ":normal a" . "        return a;\n"
    execute ":normal a" . "    }\n"
    execute ":normal a" . "    return gcd(b, a % b);\n"
    execute ":normal a" . "}\n"

endfunction

function! atcoderust#AtRustGcd() abort
    execute ":normal G"
    execute ":normal O" . "\n"
    execute ":normal a" . "fn gcd(a: i64, b: i64) -> i64 {\n"
    execute ":normal a" . "    if b == 0 {\n"
    execute ":normal a" . "        return a;\n"
    execute ":normal a" . "    }\n"
    execute ":normal a" . "    return gcd(b, a % b);\n"
    execute ":normal a" . "}\n"

endfunction

function! atcoderust#AtRustPowerMatrix(...) abort

    let dim = exists("a:1") ? a:1 : s:def_dim_matrix 

    execute ":normal G"
    execute ":normal O" . "\n"
    execute ":normal a" . "fn power_matrix(n: i64, v: &mut Vec<Vec<i64>>) -> Vec<Vec<i64>> {\n\n"
    execute ":normal a" . "    let mut ans: Vec<Vec<i64>> = vec![vec![0; " . dim . "]; " . dim . "];\n"
    execute ":normal a" . "    let mut flag = false;\n"
    execute ":normal a" . "    let mut temp;\n"
    execute ":normal a" . "    for i in 0..60 { \n"
    execute ":normal a" . "        if n & (1 << i) != 0 {\n"
    execute ":normal a" . "            if !flag {\n"
    execute ":normal a" . "                ans = v.to_vec();\n"
    execute ":normal a" . "                flag = true;\n"
    execute ":normal a" . "            }else{\n"
    execute ":normal a" . "                ans = mulmatrix(&mut ans, v);\n"
    execute ":normal a" . "            }\n"
    execute ":normal a" . "        }\n"
    execute ":normal a" . "        temp = v.clone();\n"
    execute ":normal a" . "        *v = mulmatrix(&mut temp, v);\n"
    execute ":normal a" . "    }\n\n"
    execute ":normal a" . "    return ans;\n"
    execute ":normal a" . "}\n\n"

endfunction

function! atcoderust#AtRustMulMatrix(...) abort

    let dim = exists("a:1") ? a:1 : s:def_dim_matrix 
    
    execute ":normal G"
    execute ":normal O" . "\n"
    execute ":normal a" . "fn mulmatrix(a: &mut Vec<Vec<i64>>, b: &mut Vec<Vec<i64>>) -> Vec<Vec<i64>> {\n\n"
    execute ":normal a" . "    let mut c: Vec<Vec<i64>> = vec![vec![0; " . dim . "]; " . dim . "];\n\n"
    execute ":normal a" . "    for i in 0.." . dim . " {\n"
    execute ":normal a" . "        for k in 0.." . dim . " {\n"
    execute ":normal a" . "            for j in 0.." . dim . " {\n"
    execute ":normal a" . "                c[i][j] += a[i][k] * b[k][j]; \n"
    execute ":normal a" . "            }\n"
    execute ":normal a" . "        }\n"
    execute ":normal a" . "    }\n\n"
    execute ":normal a" . "    return c;\n"
    execute ":normal a" . "}\n"

endfunction

function! atcoderust#AtRustBinarySearch() abort

    execute ":normal G"
    execute ":normal O" . "\n"
    execute ":normal a" . "fn binary_search(r: i64, l: i64, a: Vec<i64>, x: i64) -> bool {\n\n"
    execute ":normal a" . "     if r - l < 0 {\n"
    execute ":normal a" . "         return false;\n"
    execute ":normal a" . "     }\n\n"
    execute ":normal a" . "     let m = ((r + l) / 2) as usize;\n\n"
    execute ":normal a" . "     if a[m] == x {\n"
    execute ":normal a" . "         return true;\n"
    execute ":normal a" . "     }\n\n"
    execute ":normal a" . "     let mut l2: i64 = l;\n"
    execute ":normal a" . "     let mut r2: i64 = r;\n\n"
    execute ":normal a" . "     if a[m] > x { \n"
    execute ":normal a" . "         r2 = m as i64 - 1;\n"
    execute ":normal a" . "     }else {\n"
    execute ":normal a" . "         l2 = m as i64 + 1;\n"
    execute ":normal a" . "     }\n\n"
    execute ":normal a" . "     if binary_search(r2, l2, a, x) {\n"
    execute ":normal a" . "         return true;\n"
    execute ":normal a" . "     }else{\n"
    execute ":normal a" . "         return false;\n"
    execute ":normal a" . "     }\n"
    execute ":normal a" . "}\n"

endfunction

function! atcoderust#AtRustIreratorToolDefinition2() abort

    execute ":normal 1G"
    execute ":normal O" . "use itertools::Itertools;" 

endfunction

function! atcoderust#AtRustHashDefinition() abort

    execute ":normal 1G"
    execute ":normal O" . "use std::collections::HashMap;"

endfunction

function! atcoderust#AtRustQueueDefinition() abort
    execute ":normal 1G"
    execute ":normal O" . "use std::collections::VecDeque;"
endfunction

function! atcoderust#AtRustQueueDefinition2() abort
    execute ":normal O" . "let mut deque: VecDeque<i64> = VecDeque::new();"
endfunction

function! atcoderust#AtRustHashDefinition2() abort

    execute ":normal O" . "let mut map = HashMap::new();" ."\n"

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
    


     
