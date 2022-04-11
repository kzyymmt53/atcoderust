atcoderust
==
Creating Rust code for AtCoder plguin.


Installation
--
* To install using dein:
  ```
  [[plugins]]
  repo = 'kzyymmt53/atcoderust'
  ```

Usage
--
* This Command that writes proconio crate definition to the dependencies of Cargo.toml
  ```
  :RID
  ```
  The following string will be written
  ```
  proconio = "0.3.6"
  ```

  The version can be changed by using an argument
  ```                                            
  :RID <version>                             
  ```  

* This Command that creates standard input code receiving one input 
  ```
  :RIO
  ```
   
  The output is as follows
  ```
  use proconio::input;
 
  fn main() {
 
      input! {
          a: i64,
      }
 
  }   
  ```
 
  You can change the data type by using an argument
  ```
  :RIO String
  ```

* This Command that creates the codes to get some inputs
  ```
  :RIL
  ```
  
  The output is as follows
  ```
  use proconio::input;
 
  fn main() {
 
      input! {
          n: usize,
      }
 
      for _ in 0..n {
          input! {
              a: i64,
          }
      }
 
  }
  ```

  You can change the data type of 'a' variable by using an argument
  ```
  :RIL String
  ```

* This Command that creates the next_permutation function and the prev_permutation function
  ```
  :RPerm
  ```

  The next_permutation function and prev_permutation function generate permutations of sequences.  
  The functions can be used as follows.
  ```
  vector.next_permutation();
  ```

* This Command that writes itertools create definition to the dependencies of Cargo.toml
  ```
  :RITD
  ```
  The following string will be written
  ```
  itertools = "0.10.2"
  ``` 
 
  The version can be changed by using an argument
  ```                                            
  :RITD <version>
  ```  

* This Command that writes codes to import itertools. 
  ```
  :RITD2
  ```
  
  The following codes will be written on the top of the file
  ```
  use itertools::Itertools;
  ```

* This Command that writes codes to import itertools. 
  ```
  :RHash
  ```

  The following codes will be written on the top of the file
  ```
  use std::collections::HashMap;
  ```
  
* This Command that writes codes to declare a Hashmap variable. 
  ```
  :RHash2
  ```
  
  The output is as follows
  ```
  let mut map = HashMap::new();
  ```

* This Command that generates the binary search function codes. 
  ```
  :RBSearch
  ```

* This Command that writes codes to import VecDeque.
  ```
  :RDQ
  ```

  Following codes will be written on the top of the file
  ```
  use std::collections::VecDeque;
  ```

* This Command that writes codes to declare a VecDeque variable.
  ```
  :RDQ
  ```
  
  Following code will be written under the current line
  ```
  let mut deque: VecDeque<i64> = VecDeque::new();
  ```


License
--
Released under the MIT license, see LICENSE.
