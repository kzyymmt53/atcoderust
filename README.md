atcoderust
==
Creating standard input code for AtCoder plguin.


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

License
--
Released under the MIT license, see LICENSE.
